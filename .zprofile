export CLICOLOR=1
export PS1="\h:\W $ "
export LC_ALL=en_US.UTF-8
source ~/.profile
source ~/.ghcup/env
source ~/.ssh_alias 
alias passgen='LC_CTYPE=C tr -dc _A-Z-a-z-0-9 < /dev/urandom | fold -w24 | head -n1'
# alias emacs='emacs -nw'

# use GNU tools instead of BSD
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
