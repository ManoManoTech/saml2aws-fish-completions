# usage: saml2aws [ <flags >] <command >[ <args >...]
set --local subcommands \
    help \
    configure \
    login \
    exec \
    console \
    list-roles \
    script

# don't suggest files right off
complete -c saml2aws --condition __fish_is_first_arg --no-files

complete --command saml2aws --no-files
# Flags:
complete --command saml2aws --long-option help --description "Show context-sensitive help (also try --help-long and --help-man)."
complete --command saml2aws --long-option version --description "Show application version."
complete --command saml2aws --long-option verbose --description "Enable verbose logging"
complete --command saml2aws --long-option quiet --description "silences logs"
complete --command saml2aws --long-option provider=PROVIDER --short-option i --description "This flag is obsolete. See: https://github.com/Versent/saml2aws#configuring-idp-accounts"
complete --command saml2aws --long-option config=CONFIG --require-parameter --description "Path/filename of saml2aws config file (env: SAML2AWS_CONFIGFILE)"
complete --command saml2aws --long-option idp-account="default" --short-option a --description "The name of the configured IDP account. (env: SAML2AWS_IDP_ACCOUNT)"
complete --command saml2aws --long-option idp-provider=IDP-PROVIDER --description "The configured IDP provider. (env: SAML2AWS_IDP_PROVIDER)"
complete --command saml2aws --long-option mfa=MFA --require-parameter --description "The name of the mfa. (env: SAML2AWS_MFA)"
complete --command saml2aws --long-option skip-verify --short-option s --description "Skip verification of server certificate. (env: SAML2AWS_SKIP_VERIFY)"
complete --command saml2aws --long-option url=URL --require-parameter --description "The URL of the SAML IDP server used to login. (env: SAML2AWS_URL)"
complete --command saml2aws --long-option username=USERNAME --require-parameter --description "The username used to login. (env: SAML2AWS_USERNAME)"
complete --command saml2aws --long-option password=PASSWORD --require-parameter --description "The password used to login. (env: SAML2AWS_PASSWORD)"
complete --command saml2aws --long-option mfa-token=MFA-TOKEN --require-parameter --description "The current MFA token (supported in Keycloak, ADFS, GoogleApps). (env: SAML2AWS_MFA_TOKEN)"
complete --command saml2aws --long-option role=ROLE --require-parameter --description "The ARN of the role to assume. (env: SAML2AWS_ROLE)"
complete --command saml2aws --long-option aws-urn=AWS-URN --require-parameter --description "The URN used by SAML when you login. (env: SAML2AWS_AWS_URN)"
complete --command saml2aws --long-option skip-prompt --description "Skip prompting for parameters during login."
complete --command saml2aws --long-option session-duration=SESSION-DURATION --require-parameter --description "The duration of your AWS Session. (env: SAML2AWS_SESSION_DURATION)"
complete --command saml2aws --long-option disable-keychain --description "Do not use keychain at all. This will also disable Okta sessions & remembering MFA device. (env: SAML2AWS_DISABLE_KEYCHAIN)"
complete --command saml2aws --long-option region=REGION --short-option r --require-parameter --description "AWS region to use for API requests, e.g. us-east-1, us-gov-west-1, cn-north-1 (env: SAML2AWS_REGION)"
complete --command saml2aws --long-option prompter=PROMPTER --require-parameter --description "The prompter to use for user input (default, pinentry)"

# Subcommand: configure
complete --command saml2aws --condition "not __fish_seen_subcommand_from $subcommands" --arguments configure --description "Configure a new IDP account."
complete --command saml2aws --condition "__fish_seen_subcommand_from configure" --require-parameter --long-option app-id=APP-ID --description "OneLogin app id required for SAML assertion. (env: ONELOGIN_APP_ID)"
complete --command saml2aws --condition "__fish_seen_subcommand_from configure" --require-parameter --long-option client-id=CLIENT-ID --description "OneLogin client id, used to generate API access token. (env: ONELOGIN_CLIENT_ID)"
complete --command saml2aws --condition "__fish_seen_subcommand_from configure" --require-parameter --long-option client-secret=CLIENT-SECRET --description "OneLogin client secret, used to generate API access token. (env: ONELOGIN_CLIENT_SECRET)"
complete --command saml2aws --condition "__fish_seen_subcommand_from configure" --require-parameter --long-option subdomain=SUBDOMAIN --description "OneLogin subdomain of your company account. (env: ONELOGIN_SUBDOMAIN)"
complete --command saml2aws --condition "__fish_seen_subcommand_from configure" --require-parameter --long-option profile=PROFILE --short-option p --description "The AWS profile to save the temporary credentials. (env: SAML2AWS_PROFILE)"
complete --command saml2aws --condition "__fish_seen_subcommand_from configure" --require-parameter --long-option resource-id=RESOURCE-ID --description "F5APM SAML resource ID of your company account. (env: SAML2AWS_F5APM_RESOURCE_ID)"
complete --command saml2aws --condition "__fish_seen_subcommand_from configure" --require-parameter --long-option credentials-file=CREDENTIALS-FILE --description "The file that will cache the credentials retrieved from AWS. When not specified, will use the default AWS credentials file location. (env: SAML2AWS_CREDENTIALS_FILE)"
complete --command saml2aws --condition "__fish_seen_subcommand_from configure" --long-option cache-saml --description "Caches the SAML response (env: SAML2AWS_CACHE_SAML)"
complete --command saml2aws --condition "__fish_seen_subcommand_from configure" --require-parameter --long-option cache-file=CACHE-FILE --description "The location of the SAML cache file (env: SAML2AWS_SAML_CACHE_FILE)"
complete --command saml2aws --condition "__fish_seen_subcommand_from configure" --long-option disable-sessions --description "Do not use Okta sessions. Uses Okta sessions by default. (env: SAML2AWS_OKTA_DISABLE_SESSIONS)"
complete --command saml2aws --condition "__fish_seen_subcommand_from configure" --long-option disable-remember-device --description "Do not remember Okta MFA device. Remembers MFA device by default. (env: SAML2AWS_OKTA_DISABLE_REMEMBER_DEVICE)"

# Subcommand: console
complete --command saml2aws --condition "not __fish_seen_subcommand_from $subcommands" --arguments console --description "Console will open the aws console after logging in."
complete --command saml2aws --condition "__fish_seen_subcommand_from console" --require-parameter --long-option exec-profile=EXEC-PROFILE --description "The AWS profile to utilize for console execution. (env: SAML2AWS_EXEC_PROFILE)"
complete --command saml2aws --condition "__fish_seen_subcommand_from console" --require-parameter --long-option profile=PROFILE --short-option p --description "The AWS profile to save the temporary credentials. (env: SAML2AWS_PROFILE)"
complete --command saml2aws --condition "__fish_seen_subcommand_from console" --long-option force --description "Refresh credentials even if not expired."
complete --command saml2aws --condition "__fish_seen_subcommand_from console" --long-option link --description "Present link to AWS console instead of opening browser"
complete --command saml2aws --condition "__fish_seen_subcommand_from console" --require-parameter --long-option credentials-file=CREDENTIALS-FILE --description "The file that will cache the credentials retrieved from AWS. When not specified, will use the default AWS credentials file location. (env: SAML2AWS_CREDENTIALS_FILE)"

# Subcommand: exec
complete --command saml2aws --condition "not __fish_seen_subcommand_from $subcommands" --arguments exec --description "Exec the supplied command with env vars from STS token."
complete --command saml2aws --condition "__fish_seen_subcommand_from exec" --require-parameter --long-option profile=PROFILE --short-option p --description "The AWS profile to save the temporary credentials. (env: SAML2AWS_PROFILE)"
complete --command saml2aws --condition "__fish_seen_subcommand_from exec" --require-parameter --long-option exec-profile=EXEC-PROFILE --description "The AWS profile to utilize for command execution. Useful to allow the aws cli to perform secondary role assumption. (env: SAML2AWS_EXEC_PROFILE)"
complete --command saml2aws --condition "__fish_seen_subcommand_from exec" --require-parameter --long-option credentials-file=CREDENTIALS-FILE --description "The file that will cache the credentials retrieved from AWS. When not specified, will use the default AWS credentials file location. (env: SAML2AWS_CREDENTIALS_FILE)"

# Subcommand: help
complete --command saml2aws --condition "not __fish_seen_subcommand_from $subcommands" --arguments help --description "Show help."

# Subcommand: list-roles
complete --command saml2aws --condition "not __fish_seen_subcommand_from $subcommands" --arguments list-roles --description "List available role ARNs."
complete --command saml2aws --condition "__fish_seen_subcommand_from list-roles" --long-option cache-saml --description "Caches the SAML response (env: SAML2AWS_CACHE_SAML)"
complete --command saml2aws --condition "__fish_seen_subcommand_from list-roles" --require-parameter --long-option cache-file=CACHE-FILE --description "The location of the SAML cache file (env: SAML2AWS_SAML_CACHE_FILE)"

# Subcommand: login
complete --command saml2aws --condition "not __fish_seen_subcommand_from $subcommands" --arguments login --description "Login to a SAML 2.0 IDP and convert the SAML assertion to an STS token."
complete --command saml2aws --condition "__fish_seen_subcommand_from login" --require-parameter --long-option profile=PROFILE --short-option p --description "The AWS profile to save the temporary credentials. (env: SAML2AWS_PROFILE)"
complete --command saml2aws --condition "__fish_seen_subcommand_from login" --require-parameter --long-option duo-mfa-option=DUO-MFA-OPTION --description "The MFA option you want to use to authenticate with"
complete --command saml2aws --condition "__fish_seen_subcommand_from login" --require-parameter --long-option client-id=CLIENT-ID --description "OneLogin client id, used to generate API access token. (env: ONELOGIN_CLIENT_ID)"
complete --command saml2aws --condition "__fish_seen_subcommand_from login" --require-parameter --long-option client-secret=CLIENT-SECRET --description "OneLogin client secret, used to generate API access token. (env: ONELOGIN_CLIENT_SECRET)"
complete --command saml2aws --condition "__fish_seen_subcommand_from login" --long-option force --description "Refresh credentials even if not expired."
complete --command saml2aws --condition "__fish_seen_subcommand_from login" --require-parameter --long-option credential-process --description "Enables AWS Credential Process support by outputting credentials to STDOUT in a JSON message."
complete --command saml2aws --condition "__fish_seen_subcommand_from login" --require-parameter --long-option credentials-file=CREDENTIALS-FILE --description "The file that will cache the credentials retrieved from AWS. When not specified, will use the default AWS credentials file location. (env: SAML2AWS_CREDENTIALS_FILE)"
complete --command saml2aws --condition "__fish_seen_subcommand_from login" --long-option cache-saml --description "Caches the SAML response (env: SAML2AWS_CACHE_SAML)"
complete --command saml2aws --condition "__fish_seen_subcommand_from login" --require-parameter --long-option cache-file=CACHE-FILE --description "The location of the SAML cache file (env: SAML2AWS_SAML_CACHE_FILE)"
complete --command saml2aws --condition "__fish_seen_subcommand_from login" --long-option disable-sessions --description "Do not use Okta sessions. Uses Okta sessions by default. (env: SAML2AWS_OKTA_DISABLE_SESSIONS)"
complete --command saml2aws --condition "__fish_seen_subcommand_from login" --long-option disable-remember-device --description "Do not remember Okta MFA device. Remembers MFA device by default. (env: SAML2AWS_OKTA_DISABLE_REMEMBER_DEVICE)"

# Subcommand: script
complete --command saml2aws --condition "not __fish_seen_subcommand_from $subcommands" --arguments script --description "Emit a script that will export environment variables."
complete --command saml2aws --condition "__fish_seen_subcommand_from script" --require-parameter --long-option profile=PROFILE --short-option p --description "The AWS profile to save the temporary credentials. (env: SAML2AWS_PROFILE)"
complete --command saml2aws --condition "__fish_seen_subcommand_from script" --require-parameter --long-option credentials-file=CREDENTIALS-FILE --description "The file that will cache the credentials retrieved from AWS. When not specified, will use the default AWS credentials file location. (env: SAML2AWS_CREDENTIALS_FILE)"
complete --command saml2aws --condition "__fish_seen_subcommand_from script" --require-parameter --long-option shell=bash --description "Type of shell environment. Options include: bash, powershell, fish, env"
