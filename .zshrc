# starts tmux
if command -v tmux &> /dev/null && [ -z "$TMUX" ] && [ "$TERM" != "linux" ]; then
    tmux -u new
    exit
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ZSH defaults
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# same colors as dircolors, but no stat options
# https://wiki.archlinux.org/title/Color_output_in_console#ls
eval $(dircolors)
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# enable automatic change directory
setopt autocd autopushd pushdignoredups

# This is for auto ls after cding. lscwd is a custom function.
chpwd_functions=(${chpwd_functions[@]} "lscwd")

# complete only directories when cd (cd is aliased to cdls), ls, or mv is involved
compdef _dirs ls
compdef _dirs cdls
compdef _dirs mv

# zsh history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

for f in ~/.config/zsh/*;
do
    source "$f";
done

# custom keybinds
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line
bindkey "^F" forward-word
bindkey "^B" backward-word

bindkey -r '^['

# enable globbing
setopt ksh_glob
setopt extended_glob

# fzf Use fd to generate the list for directory completion
_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" -j$(nproc) . "$1"
}
_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" -j$(nproc) . "$1"
}
# source /usr/share/fzf/shell/completion.zsh
source /usr/share/fzf/shell/key-bindings.zsh

# zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#AAAAAA'
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh syntax highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# powerlevel10k theme
source ~/.powerlevel10k/powerlevel10k.zsh-theme


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
