# Have less program display colours
# from: https://wiki.archlinux.org/index.php/Color_output_in_console#man
export LESS='-R --use-color -Dd+b$Du+g'

export MANPAGER='less -s -M +Gg'
export EDITOR=/usr/bin/nvim
export VISUAL=$EDITOR
export GNUMAKEFLAGS=-j$(($(nproc) + 1))
export OMP_NUM_THREADS=$(nproc)
export LC_ADDRESS="C"
export TERMAPP='/usr/bin/termite'

# PATH additions
export PATH=$PATH:$HOME/.local/bin

# hardware video acceleration firefox
export MOZ_X11_EGL=1
export MOZ_WEBRENDER=1

# fzf settings
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --color=always'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type directory --hidden --exclude .git --color=always'
export FZF_DEFAULT_OPTS='
    --ansi
    --color=fg:#4d4d4c,bg:#eeeeee,hl:#d7005f
    --color=fg+:#4d4d4c,bg+:#e8e8e8,hl+:#d7005f
    --color=info:#4271ae,prompt:#8959a8,pointer:#d7005f
    --color=marker:#4271ae,spinner:#4271ae,header:#4271ae'

# temporary fix to libreoffice black borders
export SAL_USE_VCLPLUGIN=gen

# rofi launcher for clipmenu
export CM_LAUNCHER=rofi
export CM_HISTLENGTH=15
export CM_SELECTIONS="clipboard"
export CM_OUTPUT_CLIP=1
