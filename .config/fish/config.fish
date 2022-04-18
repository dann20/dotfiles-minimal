# Set Environment Variables
set PATH $HOME/.local/bin $PATH
set PATH $HOME/.cargo/bin $PATH
set -x EDITOR $HOME/.local/bin/lvim
set -x MYVIMRC /home/dann/.config/nvim/init.vim
set -x BROWSER /usr/bin/firefox
set -gx FZF_DEFAULT_COMMAND 'fd --type f'
set -gx FZF_DEFAULT_OPTS '--height 40% --layout=reverse --inline-info --border'

# Coloured man pages
set -x MANPAGER 'less -s -M +Gg'
set -x LESS_TERMCAP_mb (set_color -o brred)
set -x LESS_TERMCAP_md (set_color -o brred)
set -x LESS_TERMCAP_me (set_color normal)
set -x LESS_TERMCAP_se (set_color normal)
set -x LESS_TERMCAP_so (set_color bryellow)
set -x LESS_TERMCAP_ue (set_color normal)
set -x LESS_TERMCAP_us (set_color -o brgreen)

function fish_greeting
	fortune
end

# Set aliases
alias ls="exa -a"
alias la="exa -la"
alias vim="lvim"
alias vi="lvim"
alias vv="$HOME/.config/vifm/scripts/vifmrun"
alias v.="$HOME/.config/vifm/scripts/vifmrun_here"
alias v='vifm'
alias .='vifm .'
alias ..="cd .."
alias ...="cd ../.."
alias ps="ps -A"
alias pacmanlog="nvim /var/log/pacman.log"
alias config="/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME"
alias cp="cp -i" # confirm before overwriting sth
alias cfish="clear;fish"
alias cbash="clear;bash"
alias fd="fd -H --type f"
alias cat="bat"
alias remake="sudo make clean install"
alias vol="pulsemixer"
alias ,="ranger ."
alias ipa="ip a"
alias battery='cat /sys/class/power_supply/BAT0/capacity'
alias lg='lazygit'
alias lc="lg --git-dir=$HOME/.cfg --work-tree=$HOME"
alias ncdu="ncdu --color off"

# Set abbreviations
abbr :de '& && disown && exit'
abbr :ka 'killall'
abbr :q 'exit'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/dann/miniconda/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

starship init fish | source
thefuck --alias | source
