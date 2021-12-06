session=$(tmux ls | fzf)

if [ -n "$session" ]; then
    name=$(echo "$session" | cut -d ':' -f 1)
    tmux kill-session -t "$name"
    tmux refresh-client -S
fi
