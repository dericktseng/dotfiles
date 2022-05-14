sessions=$(tmux ls -F "#{session_name}" | fzf-tmux -m --reverse)
session_count=$(tmux ls | wc -l)
curr_session=$(tmux display-message -p '#S')

while read session; do
    if [ -n "$session" ]; then
        if [ "$session_count" -gt 1 ] && [ "$curr_session" == "$session" ]; then
            tmux switch-client -n
        fi
        tmux kill-session -t "$session"
    fi
done <<< "$sessions"

tmux refresh-client -S
