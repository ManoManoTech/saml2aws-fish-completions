@test "should provides completion for `saml2aws`" (
        complete --do-complete "saml2aws " | wc -l
) = 7

@test "should provides completion for `saml2aws help`" (
        complete --do-complete "saml2aws help "
)
