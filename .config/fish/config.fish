# Set Environment Variables
set -x EDITOR /usr/bin/nvim
set -x MYVIMRC /home/dann/.config/nvim/init.vim
set -x BROWSER /usr/bin/firefox
set -gx FZF_DEFAULT_COMMAND 'fd --type f'
set -gx FZF_DEFAULT_OPTS '--height 40% --layout=reverse --inline-info'
## Coloured man pages
set -x LESS_TERMCAP_mb (set_color -o brred)
set -x LESS_TERMCAP_md (set_color -o brred)
set -x LESS_TERMCAP_me (set_color normal)
set -x LESS_TERMCAP_se (set_color normal)
set -x LESS_TERMCAP_so (set_color bryellow)
set -x LESS_TERMCAP_ue (set_color normal)
set -x LESS_TERMCAP_us (set_color -o brgreen)

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
alias ipa="ip a"

# Set abbreviations
abbr :de '& && disown && exit'
abbr ka 'killall'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/dann/miniconda/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

starship init fish | source
