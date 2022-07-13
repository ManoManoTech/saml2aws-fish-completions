set shell := ["fish", "-c"]

@dev-reinstall:
    rm --force $HOME/.config/fish/completions/saml2aws.fish
    complete --command saml2aws --erase
    fisher install ./

test-auto-completion: dev-reinstall
    complete --do-complete "saml2aws exec -" 