# if nvim exists, use that, otherwise, default to vim
editor="vim"
if [[ ! -z $(command -v nvim) ]];then
    editor="nvim"
    alias vim=$editor
    alias nvim=$editor
    export MANPAGER='nvim +Man!'
fi

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

# fzf settings
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --color=always'
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

