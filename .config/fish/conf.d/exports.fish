# fish settings
set -g fish_greeting

# fzf settings
set -gx FZF_DEFAULT_COMMAND "fd --type file --hidden -I --exclude .git --color=always"
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx FZF_ALT_C_COMMAND "fd --type directory --hidden -I --exclude .git --color=always"
set -gx FZF_DEFAULT_OPTS "
    --ansi
    --color=fg:#4d4d4c,bg:#eeeeee,hl:#d7005f
    --color=fg+:#4d4d4c,bg+:#e8e8e8,hl+:#d7005f
    --color=info:#4271ae,prompt:#8959a8,pointer:#d7005f
    --color=marker:#4271ae,spinner:#4271ae,header:#4271ae"

# compile settings
set -gx GNUMAKEFLAGS "-j$(nproc)"
set -gx OMP_NUM_THREADS "$(nproc)"
set -gx LC_ADDRESS "C"
