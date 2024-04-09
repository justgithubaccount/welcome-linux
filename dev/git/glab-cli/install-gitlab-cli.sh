# https://gitlab.com/gitlab-org/cli/-/releases
sudo apt install ./glab_1.36.0_Linux_x86_64.deb 

# Authenticate with the method appropriate for your GitLab instance (for GitLab SaaS)
glab auth login --stdin < glab-debian-token.txt
glab config set --global editor nano # micro

# vs code extension
ext install GitLab.gitlab-workflow