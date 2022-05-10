# Environment Variables
set -x PATH $HOME/.local/bin $HOME/.cargo/bin $PATH
set -x EDITOR $HOME/.local/bin/lvim
set -x VISUAL $HOME/.local/bin/lvim
set -x MYVIMRC /home/dann/.config/nvim/init.vim
set -x BROWSER /usr/bin/firefox
set -x GTK2_RC_FILES $HOME/.config/gtk-2.0/gtkrc-2.0
set -x FZF_DEFAULT_COMMAND 'fd --type f'
set -x FZF_DEFAULT_OPTS '--height 40% --layout=reverse --inline-info --border'

# Coloured man pages
set -x MANPAGER 'less -s -M +Gg'
set -x LESS_TERMCAP_mb (set_color -o brred)
set -x LESS_TERMCAP_md (set_color -o brred)
set -x LESS_TERMCAP_me (set_color normal)
set -x LESS_TERMCAP_se (set_color normal)
set -x LESS_TERMCAP_so (set_color bryellow)
set -x LESS_TERMCAP_ue (set_color normal)
set -x LESS_TERMCAP_us (set_color -o brgreen)

# Functions
if test -d $HOME/.config/fish/functions
    for func in $HOME/.config/fish/functions/*.fish
        if test -e $func; source $func; end
    end
end

function set_keybindings
    bind -M insert \cs fssh
    bind -M insert \cb fzf-bcd-widget
    bind -M insert \cp fzf-cdhist-widget
end

function fish_greeting
	fortune
end

function fish_user_key_bindings
	fish_vi_key_bindings
	fzf_key_bindings
    set_keybindings
end

# Source utilities
starship init fish | source
thefuck --alias | source
zoxide init fish --cmd j | source
source /etc/grc.fish

# Aliases
alias ls="exa -a"
alias la='exa -al --icons --git --time-style=long-iso'
alias vim="$EDITOR"
alias vi="$EDITOR"
alias vv="$HOME/.config/vifm/scripts/vifmrun"
alias v.="$HOME/.config/vifm/scripts/vifmrun_here"
alias v='vifm'
alias .='vifm .'
alias ..="cd .."
alias ...="cd ../.."
alias pacmanlog="$EDITOR /var/log/pacman.log"
alias config="/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME"
alias cp="cp -i" # confirm before overwriting sth
alias fd="fd -H --type f"
alias cat="bat"
alias remake="doas make clean install"
alias vol="pulsemixer"
alias ipa="ip a"
alias battery='cat /sys/class/power_supply/BAT0/capacity'
alias lg='lazygit'
alias lc="lg --git-dir=$HOME/.cfg --work-tree=$HOME"
alias ncdu="ncdu --color off"
alias tmux="TERM=xterm-256color tmux -2"
alias tree="exa --tree"

# Abbreviations
abbr :de '& && disown && exit'
abbr :ka 'killall'
abbr :q 'exit'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/dann/miniconda/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
