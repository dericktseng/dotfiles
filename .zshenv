# if nvim exists, use that, otherwise, default to vim
editor="vim"
if [[ ! -z $(command -v nvim) ]];then
    editor="nvim"
    alias vim=$editor
    alias nvim=$editor
fi

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
export TERM=xterm-256color
export EDITOR=$editor
export VISUAL=$editor
export TERMCMD=$TERM
export TERMINAL=$TERM
export GNUMAKEFLAGS=-j$(nproc)
export OMP_NUM_THREADS=$(nproc)
export PERL_DESTRUCT_LEVEL=2
export LC_ADDRESS="C"
export PATH=$PATH:$HOME/.local/bin

# hardware video acceleration firefox
export MOZ_X11_EGL=1
export MOZ_WEBRENDER=1

# fzf settings
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --color=always'
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# pacdiff
export DIFFPROG="nvim -d"

# temporary fix to libreoffice black
export SAL_USE_VCLPLUGIN=gen
