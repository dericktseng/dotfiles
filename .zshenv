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

# fix for java windows
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit

# NNN colors
BLOCK_DEVICE="c1"
CHAR_DEVICE="d6"
DIRECTORY="27"
EXECUTABLE="1d"
REGULAR="00"
HARD_LINK="60"
SYMBOLIC_LINK="37"
MISSING="f7"
ORPHANED="c6"
FIFO="d6"
SOCKET="ab"
UNKNOWN="c4"

# NNN bookmarks
dtmp="b:$HOME/Desktop/Derick/tmp/"
home="h:$HOME"
root="/:/"
docs="z:$HOME/Documents/books"

# NNN Plugins
previewtui="p:-preview-tui"
suedit="s:suedit"
fzopen="f:-fzopen2"
fzcd="d:-fzcd2"
getplugs="u:getplugs"
rsynccp="c:rsynccp"
imagecopy='i:!convert $nnn png:- | xclip -sel clipboard -t image/png*'

# NNN configurations
export NNN_FCOLORS="$BLOCK_DEVICE$CHAR_DEVICE$DIRECTORY$EXECUTABLE$REGULAR$HARD_LINK$SYMBOLIC_LINK$MISSING$ORPHANED$FIFO$SOCKET$UNKNOWN"
export NNN_PLUG="$previewtui;$suedit;$fzopen;$fzcd;$getplugs;$rsynccp;$imagecopy"
export NNN_BMS="$dtmp;$home;$root;$docs"
export NNN_OPENER="$HOME/.config/nnn/plugins/nuke2"
export NNN_OPTS="ac"
export SPLIT="v"
