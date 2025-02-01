# starts tmux
# if command -v tmux &> /dev/null && [ -z "$TMUX" ] && [ "$TERM" != "linux" ]; then
#     tmux -u new
#     exit
# fi

# export PATH
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:/var/lib/flatpak/exports/bin:$PATH"

# zsh fpath
fpath=(~/.config/zsh/ $fpath)

# ZSH Options
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.
setopt COMPLETE_ALIASES     # completes aliases as well.

autoload -U +X compinit && compinit

# Field order is :completion:function:completer:command:argument:tag
# ZSH defaults
zstyle ':completion:*' menu select
zstyle ':completion:*' complete true
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' complete-options true
zstyle ':completion:*' file-sort modification

# rm object files first.
zstyle ':completion:*:*:rm:*:*' file-patterns '*.o:object-files' '%p:all-files'

# This is for auto ls after cding. lscwd is a custom function.
chpwd_functions=(${chpwd_functions[@]} "lscwd")

# same colors as dircolors, but no stat options
# https://wiki.archlinux.org/title/Color_output_in_console#ls
# eval $(dircolors)
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# enable automatic change directory
setopt autocd autopushd pushdignoredups

# completion with hidden files
#_comp_options+=(globdots)

# zsh history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

for f in ~/.config/zsh/*; do
    source "$f"
done

# custom keybinds
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line
bindkey "^F" forward-word
bindkey "^B" backward-word
bindkey "^[[3~" delete-char

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

# zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#AAAAAA'
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# zoxide
eval "$(zoxide init zsh)"
