# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ZSH defaults
autoload -Uz compinit 
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

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

# same colors as dircolors
eval "$(dircolors)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# imported functions and aliases from bash
if [ -f ~/.bash_profile ]; then
    source ~/.bash_profile
fi

for f in ~/.config/zsh/*;
do
    source "$f";
done

# custom keybinds
bindkey "^@" autosuggest-accept
bindkey "^A" vi-beginning-of-line
bindkey "^[a" vi-beginning-of-line
bindkey "^E" vi-end-of-line
bindkey "^[e" vi-end-of-line
bindkey "^[[3~" delete-char # urxvt delete key
bindkey "^[[P" delete-char # st delete key

# enable globbing
setopt ksh_glob
setopt extended_glob

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

source $HOME/.config/fzf/completion.zsh
source $HOME/.config/fzf/key-bindings.zsh
source /etc/profile.d/vte.sh

# powerlevel10k
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# zsh syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
