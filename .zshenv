editor="nvim"
alias vim=$editor

# Have less display colours
# from: https://wiki.archlinux.org/index.php/Color_output_in_console#man
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;33m'     # begin blink
export LESS_TERMCAP_so=$'\e[01;44;37m' # begin reverse video
export LESS_TERMCAP_us=$'\e[01;37m'    # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal

export MANPAGER='less -s -M +Gg'
export EDITOR=$editor
export VISUAL=$editor
export GNUMAKEFLAGS=-j$(nproc)
export OMP_NUM_THREADS=$(nproc)
export LC_ADDRESS="C"

# PATH additions
export PATH=$PATH:$HOME/.local/bin

# hardware video acceleration firefox
export MOZ_X11_EGL=1
export MOZ_WEBRENDER=1

# fzf settings
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --color=always'
export FZF_DEFAULT_OPTS='--ansi'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# temporary fix to libreoffice black
export SAL_USE_VCLPLUGIN=gen

# nnn configs
alias nnn="/usr/bin/nnn -P p"

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

export NNN_FCOLORS="$BLOCK_DEVICE$CHAR_DEVICE$DIRECTORY$EXECUTABLE$REGULAR$HARD_LINK$SYMBOLIC_LINK$MISSING$ORPHANED$FIFO$SOCKET$UNKNOWN"
export NNN_PLUG="p:-preview-tui-ext2;s:suedit;f:-fzopen2;d:-fzcd;u:getplugs"
export NNN_BMS="b:$HOME/Desktop/Derick/tmp/;h:$HOME;/:/"
export NNN_OPENER="$HOME/.config/nnn/plugins/nuke2"
export NNN_OPTS="ac"
export SPLIT="v"

