function man --wraps man --description 'Format and display manual pages'
    set -lx LESS_TERMCAP_mb $(set_color -o brred)
    set -lx LESS_TERMCAP_md $(set_color -o brred)
    set -lx LESS_TERMCAP_me $(set_color normal)
    set -lx LESS_TERMCAP_se $(set_color normal)
    set -lx LESS_TERMCAP_so $(set_color bryellow)
    set -lx LESS_TERMCAP_ue $(set_color normal)
    set -lx LESS_TERMCAP_us $(set_color -o brgreen)

    set -lx GROFF_NO_SGR yes

    set -lx MANPATH (string join : $MANPATH)
    if test -z "$MANPATH"
        type -q manpath
        and set MANPATH (command manpath)
    end

    # Check data dir for Fish 2.x compatibility
    set -l fish_data_dir
    if set -q __fish_data_dir
        set fish_data_dir $__fish_data_dir
    else
        set fish_data_dir $__fish_datadir
    end

    set -l fish_manpath (dirname $fish_data_dir)/fish/man
    if test -d "$fish_manpath" -a -n "$MANPATH"
        set MANPATH "$fish_manpath":$MANPATH
        command man $argv
        return
    end
    command man $argv
end
