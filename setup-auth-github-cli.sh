# github cli setup (auth)
# https://cli.github.com/manual/gh_auth_login
# https://docs.github.com/en/enterprise-server@3.6/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens

# start interactive setup
gh auth login

# authenticate against github.com by reading the token from a file
gh auth login --with-token < debian-wsl-token.txt

# authenticate with a specific GitHub instance
gh auth login --hostname enterprise.internal
