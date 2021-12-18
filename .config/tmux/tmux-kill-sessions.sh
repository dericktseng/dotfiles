sessions=$(tmux ls | fzf-tmux -m)

while read session; do
    if [ -n "$session" ]; then
        name=$(echo "$session" | cut -d ':' -f 1)
        tmux kill-session -t "$name"
    fi
done <<< "$sessions"

tmux refresh-client -S
