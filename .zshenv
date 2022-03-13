# Have less program display colours
# from: https://wiki.archlinux.org/index.php/Color_output_in_console#man
export LESS='-R --use-color -Dd+b$Du+g'

export MANPAGER='less -s -M +Gg'
export EDITOR=/usr/bin/nvim
export VISUAL=$EDITOR
export GNUMAKEFLAGS=-j$(($(nproc) + 1))
export OMP_NUM_THREADS=$(nproc)
export LC_ADDRESS="C"
export TERMINAL='/usr/bin/termite'

# hardware video acceleration firefox
export MOZ_X11_EGL=1
export MOZ_WEBRENDER=1
export MOZ_DISABLE_RDD_SANDBOX=1
export MOZ_USE_XINPUT2=1

# fzf settings
export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --exclude .git --color=always"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type directory --hidden --exclude .git --color=always"
export FZF_DEFAULT_OPTS="
    --ansi
    --color=fg:#4d4d4c,bg:#eeeeee,hl:#d7005f
    --color=fg+:#4d4d4c,bg+:#e8e8e8,hl+:#d7005f
    --color=info:#4271ae,prompt:#8959a8,pointer:#d7005f
    --color=marker:#4271ae,spinner:#4271ae,header:#4271ae"

# fix for java windows
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
