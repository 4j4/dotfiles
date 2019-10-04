export CLICOLOR=1
#export LSCOLORS=ecfxcxdxbxegedabagacad
export PS1="\h:\W $ "
source ~/.profile
source ~/.ghcup/env
alias passgen='LC_CTYPE=C tr -dc _A-Z-a-z-0-9 < /dev/urandom | fold -w24 | head -n1'

# use GNU tools instead of BSD
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
