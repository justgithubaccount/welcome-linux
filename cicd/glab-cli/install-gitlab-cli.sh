# https://gitlab.com/gitlab-org/cli/-/releases

# wget -P ~/Downloads https://gitlab.com/gitlab-org/cli/-/releases/v1.39.0/downloads/glab_1.39.0_Linux_x86_64.deb

sudo apt install ./glab_1.39.0_Linux_x86_64.deb 

# Authenticate with the method appropriate for your GitLab instance (for GitLab SaaS)
# https://gitlab.com/gitlab-org/cli#personal-access-token

glab auth login --stdin < glab-debian-token.txt
glab config set --global editor nano # micro

# vs code extension
ext install GitLab.gitlab-workflow