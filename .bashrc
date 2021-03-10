#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='exa -a'
alias la="exa -la"
alias vim="nvim"
alias vi="nvim"
alias .="vifm ."
alias ..="cd .."
alias ...="cd ../.."
alias ps="ps -A"
alias pacmanlog="nvim /var/log/pacman.log"
alias config="/usr/bin/git --git-dir=/home/dann/.cfg --work-tree=/home/dann"
alias cp="cp -i" # confirm before overwriting sth
alias cfish="clear;fish"
alias fd="fd -H --type f"
alias cat="bat"
alias cbash="clear;bash"
alias czsh="clear;zsh"

PS1='[\u@\h \W]\$ '

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/dann/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/dann/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/dann/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/dann/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

