# https://shivamarora.medium.com/a-guide-to-manage-your-environment-variables-in-a-better-way-using-direnv-2c1cd475c8e

sudo apt-get install direnv

# bash users - add the following line to your ~/.bashrc
eval "$(direnv hook bash)"

# zsh users - add the following line to your ~/.zshrc
eval "$(direnv hook zsh)"

# restart terminal or source
source ~/.bashrc
source ~/.zshrc