set shell := ["fish", "-c"]
# new Fish docker image version wait for: https://github.com/andreiborisov/docker-fish/pull/22
FISH_VERSION := "3.1.2" 

usage:
    @printf "usage:"
    @printf "\tjust build-project-on FISH_VERSION=3.4.0\t# build container\n"
    @printf "\tjust test-project-on  FISH_VERSION=3.4.0\t# run tests\n"
    @printf "\tjust dev-project-on   FISH_VERSION=3.4.0\t# dev in container\n"

@dev-reinstall:
    rm --force $HOME/.config/fish/completions/saml2aws.fish
    complete --command saml2aws --erase
    fisher install ./

test-auto-completion: dev-reinstall
    complete --do-complete "saml2aws exec -" 

test-without-container:
    fishtape tests/*


build-project-on:
    docker build \
        --file ./Dockerfile \
        --build-arg FISH_VERSION={{FISH_VERSION}} \
        --tag=project-on-fish-{{FISH_VERSION}} \
        ./

# can be overriden by user
CMD := "fish"
dev-project-on:
    docker run \
        --name run-project-on-{{FISH_VERSION}} \
        --rm \
        --interactive \
        --tty \
        --volume=(pwd):/tmp/app/ \
        project-on-fish-{{FISH_VERSION}} "{{CMD}}"

# can be overriden by user
TEST := "fishtape tests/*.test.fish "
# Don't override COPY directive as `--volume` doesnt play nice with Travis
test-project-on:
    docker run \
        --name run-project-on-{{FISH_VERSION}} \
        --rm \
        --tty \
        project-on-fish-{{FISH_VERSION}} "{{TEST}}"
