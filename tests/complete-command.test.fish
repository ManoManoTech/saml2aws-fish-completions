set number_of_subcommands 7
@test "should provides correct number of subcommands from `saml2aws`" (
        complete --do-complete "saml2aws " | wc -l
) = $number_of_subcommands

set number_of_core_options 21
@test "should provides correct number of options from `saml2aws`" (
        complete --do-complete "saml2aws --" | wc -l
) = $number_of_core_options

set number_of_specific_HELP_options 0
set total_HELP_options (math $number_of_core_options + $number_of_specific_HELP_options)
@test "should provides correct number of suggestion `saml2aws help`" (
        complete --do-complete "saml2aws help --" | wc -l
) = $total_HELP_options

set number_of_specific_CONFIGURE_options 11
set total_CONFIGURE_options (math $number_of_core_options + $number_of_specific_CONFIGURE_options)
@test "should provides correct number of suggestion for `saml2aws configure --`" (
        complete --do-complete "saml2aws configure --" | wc -l
) = $total_CONFIGURE_options

set number_of_specific_LOGIN_options 11
set total_LOGIN_options (math $number_of_core_options + $number_of_specific_LOGIN_options)
@test "should provides correct number of suggestion for `saml2aws login --`" (
        complete --do-complete "saml2aws login --" | wc -l
) = $total_LOGIN_options

set number_of_specific_EXEC_options 3
set total_EXEC_options (math $number_of_core_options + $number_of_specific_EXEC_options)
@test "should provides correct number of suggestion for `saml2aws exec --`" (
        complete --do-complete "saml2aws exec --" | wc -l
) = $total_EXEC_options

set number_of_specific_CONSOLE_options 5
set total_CONSOLE_options (math $number_of_core_options + $number_of_specific_CONSOLE_options)
@test "should provides correct number of suggestion for `saml2aws console --`" (
        complete --do-complete "saml2aws console --" | wc -l
) = $total_CONSOLE_options

set number_of_specific_LIST_ROLES_options 2
set total_LIST_ROLES_options (math $number_of_core_options + $number_of_specific_LIST_ROLES_options)
@test "should provides correct number of suggestion for `saml2aws list-roles --`" (
        complete --do-complete "saml2aws list-roles --" | wc -l
) = $total_LIST_ROLES_options

set number_of_specific_SCRIPT_options 3
set total_SCRIPT_options (math $number_of_core_options + $number_of_specific_SCRIPT_options)
@test "should provides correct number of suggestion for `saml2aws script --`" (
        complete --do-complete "saml2aws script --" | wc -l
) = $total_SCRIPT_options
