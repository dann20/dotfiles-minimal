# Set Environment Variables
set -x EDITOR /usr/bin/nvim
set -x MYVIMRC /home/dann/.config/nvim/init.vim
set -x BROWSER /usr/bin/firefox
set -gx FZF_DEFAULT_COMMAND 'fd --type f'
set -gx FZF_DEFAULT_OPTS '--height 40% --layout=reverse --inline-info'
funcsave fish_greeting

# Set aliases
alias ls="exa -a"
alias la="exa -la"
alias vim="nvim"
alias vi="nvim"
alias v="vifm"
alias .="vifm ."
alias ..="cd .."
alias ...="cd ../.."
alias ps="ps -A"
alias pacmanlog="nvim /var/log/pacman.log"
alias config="/usr/bin/git --git-dir=/home/dann/.cfg --work-tree=/home/dann"
alias cp="cp -i" # confirm before overwriting sth
alias cfish="clear;fish"
alias cbash="clear;bash"
alias fd="fd -H --type f"
alias cat="bat"
alias remake="sudo make clean install"
alias vol="pulsemixer"
alias ,="ranger ."

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/dann/miniconda/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
conda activate fedml

starship init fish | source
