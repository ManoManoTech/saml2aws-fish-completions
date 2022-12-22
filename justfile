set shell := ["fish", "-c"]
FISH_VERSION := "3.5.1" 

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


build-project-on fish_version=FISH_VERSION:
    docker build \
        --file ./Dockerfile \
        --build-arg FISH_VERSION={{fish_version}} \
        --tag=project-on-fish-{{fish_version}} \
        ./

# can be overriden by user
CMD := "fish"
dev-project-on fish_version=FISH_VERSION:
    docker run \
        --name run-project-on-{{fish_version}} \
        --rm \
        --interactive \
        --tty \
        --volume=(pwd):/tmp/app/ \
        project-on-fish-{{fish_version}} "{{CMD}}"

# can be overriden by user
TEST := "fishtape tests/*.test.fish "
# Don't override COPY directive as `--volume` doesnt play nice with Travis
test-project-on fish_version=FISH_VERSION:
    docker run \
        --name run-project-on-{{fish_version}} \
        --rm \
        --tty \
        project-on-fish-{{fish_version}} "{{TEST}}"
