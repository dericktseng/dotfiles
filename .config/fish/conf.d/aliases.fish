set -gx EDITOR '/usr/bin/nvim'
set -gx VISUAL "$EDITOR"

alias l="/bin/ls --group-directories-first --color=auto"
alias ls="/bin/ls --group-directories-first --color=auto"
alias ll="/bin/ls -lh --group-directories-first --color=auto"
alias la="/bin/ls -A --group-directories-first --color=auto"
alias lla="/bin/ls -lAh --group-directories-first --color=auto"
alias df='/usr/bin/df -h'
alias free='free --human'
alias hosts='cut -d "," -f 1 ~/.ssh/known_hosts | cut -d " " -f 1 | uniq'
alias src="exec /usr/bin/fish"
alias vim="/usr/bin/nvim"
alias vv="source .venv/bin/activate.fish"
alias open="xdg-open"
alias locate="locate -e"
alias gdb="gdb -tui"
alias ytdl="yt-dlp"
alias dt="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias tmux="tmux -u"
alias diff="diff --color=auto"
alias governor="cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor | sort | uniq -c"
alias grub-update="sudo grub2-mkconfig -o /boot/grub2/grub.cfg"
alias visudo="sudo EDITOR=$EDITOR visudo"
alias kde-reload="qdbus org.kde.KWin /KWin reconfigure"
