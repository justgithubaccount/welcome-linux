# https://docs.gitlab.com/runner/install/linux-repository.html
# https://docs.gitlab.com/ee/user/packages/container_registry/build_and_push_images.html
# https://docs.gitlab.com/ee/ci/docker/using_docker_build.html#use-docker-in-docker

# Установка раннера на сервере
curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash
sudo apt install gitlab-runner

# Запустить раннер
gitlab-runner run

# Поцепить хранилку образов докера на гитлабе
docker login registry.gitlab.com -u justgitlabaccount -p glpat-12345678909876543210

sudo usermod -aG docker gitlab-runner
