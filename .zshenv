# Have less program display colours
# from: https://wiki.archlinux.org/index.php/Color_output_in_console#man
export LESS='-R --use-color -Dd+r$Du+b'
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export EDITOR='/usr/bin/nvim'
export VISUAL="$EDITOR"

# firefox variables
# export MOZ_X11_EGL=1
# export MOZ_DISABLE_RDD_SANDBOX=1
# export MOZ_WEBRENDER=1
# export MOZ_USE_XINPUT2=1

# fzf settings
export FZF_DEFAULT_COMMAND="fd --type file --hidden -I --exclude .git --color=always"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type directory --hidden -I --exclude .git --color=always"
export FZF_DEFAULT_OPTS="
    --ansi
    --color=fg:#4d4d4c,bg:#eeeeee,hl:#d7005f
    --color=fg+:#4d4d4c,bg+:#e8e8e8,hl+:#d7005f
    --color=info:#4271ae,prompt:#8959a8,pointer:#d7005f
    --color=marker:#4271ae,spinner:#4271ae,header:#4271ae"

# fix for java windows
# export _JAVA_AWT_WM_NONREPARENTING=1
# export AWT_TOOLKIT=MToolkit

# fix for python webbrowser module
export BROWSER='flatpak run io.gitlab.librewolf-community'

# compile settings
GNUMAKEFLAGS="-j$(($(nproc) + 1))"
OMP_NUM_THREADS="$(nproc)"
LC_ADDRESS="C"
