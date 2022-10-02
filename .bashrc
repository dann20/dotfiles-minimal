#
# ~/.bashrc
#

welcome(){
	echo "--- Back to bash ---"
	fortune
}

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

# PS1='[\u@\h \W]\$ '

# Get the status code from the last command executed
STATUS=$?

# Get the number of jobs running.
NUM_JOBS=$(jobs -p | wc -l)

# Set the prompt to the output of `starship prompt`
PS1="$(starship prompt --status=$STATUS --jobs=$NUM_JOBS)"

set -o vi

# starship_precmd_user_func="welcome"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/dann/miniconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/dann/miniconda/etc/profile.d/conda.sh" ]; then
        . "/home/dann/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/home/dann/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(starship init bash)"
source "/home/dann/.local/share/cargo/env"
