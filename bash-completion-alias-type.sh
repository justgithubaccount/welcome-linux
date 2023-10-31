sudo apt install bash-completion

# ~/.bashrc - for user, /etc/bashrc - for all

# alias
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias cls=clear

# commands without alias
/ls
"ls"
command ls

# builtin and non-builtin

type ls
# ls is aliased to `ls --color=auto'

type mkdir
# mkdir is /usr/bin/mkdir

type cd
# cd is a shell builtin

type -a ls
# ls is aliased to `ls --color=auto'
# ls is /usr/bin/ls
# ls is /bin/ls