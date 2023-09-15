# Environment Variables
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_STATE_HOME $HOME/.local/state
set -x LANGUAGE en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x LC_TYPE en_US.UTF-8

fish_add_path $HOME/.local/share/go/bin
fish_add_path $HOME/.local/go/bin
fish_add_path $XDG_DATA_HOME/cargo/bin
fish_add_path $XDG_DATA_HOME/nvim/mason/bin
fish_add_path $HOME/.local/bin

set -x EDITOR $(which nvim)
set -x VISUAL $(which nvim)
set -x MYVIMRC $XDG_CONFIG_HOME/nvim/init.vim
set -x BROWSER $(which firefox)
set -x PAGER $(which bat)
set -x BAT_PAGER 'less -SRXF'

set -x XINITRC $XDG_CONFIG_HOME/X11/xinitrc
set -x GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0
set -x CONDARC $XDG_CONFIG_HOME/conda/condarc
set -x LESSHISTFILE $XDG_DATA_HOME/lesshst
set -x GOPATH $XDG_DATA_HOME/go
set -x CARGO_HOME $XDG_DATA_HOME/cargo
set -x RUSTUP_HOME $XDG_DATA_HOME/rustup
set -x NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -x JUPYTER_CONFIG_DIR $XDG_CONFIG_HOME/jupyter
set -x CUDA_CACHE_PATH  $XDG_CACHE_HOME/nv
set -x RIPGREP_CONFIG_PATH $XDG_CONFIG_HOME/ripgrep/ripgreprc

set -x FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow'
set -x FZF_DEFAULT_OPTS '--height 40% --layout=reverse --inline-info --border'
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -x FZF_ALT_C_COMMAND 'fd --type d --hidden --follow'

# Coloured man pages
set -x MANPAGER 'less -s -M +Gg'
set -x LESS_TERMCAP_mb $(set_color -o brred)
set -x LESS_TERMCAP_md $(set_color -o brred)
set -x LESS_TERMCAP_me $(set_color normal)
set -x LESS_TERMCAP_se $(set_color normal)
set -x LESS_TERMCAP_so $(set_color bryellow)
set -x LESS_TERMCAP_ue $(set_color normal)
set -x LESS_TERMCAP_us $(set_color -o brgreen)

# Set user installed library path
set -x CPATH $HOME/.local/include
set -x LIBRARY_PATH $HOME/.local/lib
set -x LD_LIBRARY_PATH $HOME/.local/lib

# better_exceptions variables
set -x BETTER_EXCEPTIONS 1
set -x FORCE_COLOR 1

# fx settings
set -x FX_LANG 'python3'
set -x FX_THEME '4'
set -x FX_SHOW_SIZE 'true'

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
    bind -M insert \cf fzf-file-widget
end

if type -q fortune
    function fish_greeting
        fortune
    end
end

function fish_user_key_bindings
	fish_vi_key_bindings
    if type -q fzf
        fzf_key_bindings
    end
    set_keybindings
end

# Set prompt
if type -q starship
    starship init fish | source
else
    function fish_mode_prompt
        switch $fish_bind_mode
            case default
                set_color --bold red
                echo '[N] '
            case insert
                set_color --bold green
                echo '[I] '
            case replace_one
                set_color --bold green
                echo '[R] '
            case visual
                set_color --bold brmagenta
                echo '[V] '
            case '*'
                set_color --bold red
                echo '[?] '
        end
    end
    set_color normal
end

# Source utilities
if type -q thefuck
    thefuck --alias | source
end

if type -q zoxide
    zoxide init fish --cmd j | source
end

# Aliases
alias ls="eza -a -s name --group-directories-first"
alias la='eza -alg --icons --git --time-style=long-iso -s name --group-directories-first'
alias vim="$EDITOR"
alias vi="$EDITOR"
alias v='vifm'
alias .='vifm .'
alias ..="cd .."
alias ...="cd ../.."
alias cp="cp -i" # confirm before overwriting sth
alias fd="fd -H"
alias cat="bat"
alias vol="pulsemixer"
alias ipa="ip a"
alias lg='lazygit'
alias ncdu="ncdu --color off"
alias tree="eza --tree"
if test -e $XINITRC
    alias startx="startx $XINITRC"
end
alias gitlog="git log --graph \
--pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' \
--abbrev-commit"

function tmux
    TERM=xterm-256color command tmux -2 -u $argv
end

# Abbreviations
abbr :de '& && disown && exit'
abbr :ka 'killall'
abbr :q 'exit'

if test -e "$HOME/.local/bin/lvim"
    set -x VISUAL $HOME/.local/bin/lvim
    set -x EDITOR $HOME/.local/bin/lvim
    alias vi="$EDITOR"
    alias vim="$EDITOR"
end

set LOCAL_CONFIG "$XDG_CONFIG_HOME/fish/local.fish"
if test -e $LOCAL_CONFIG
    source $LOCAL_CONFIG
end
