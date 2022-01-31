# Personal Dotfiles

## Feature List
- [x] Polybar Desktop Icons with Bspwm
- [x] PDF search with rofi
- [x] NNN File manager custom preview script
- [x] TMUX show session names in statusbar
- [x] TMUX launch special workspaces in own session (fzf integration)
- [x] Fzf background wallpaper setter
- [x] Setup / install script
- [ ] Zathura search integration with `pdfgrep`

## Installation
1. Execute `curl -L 'https://git.io/JCfgy' | bash`
1. Navigate to `$HOME/.pkglist`
1. Run the `run_all.sh` script (without sudo privileges)
    - `run_all.sh` installs all packages in `pkglist.txt` and `pkglist_aur.txt`
    - if you only want official repo packages, run `install.sh`.
    - The `install_aur.sh` script installs only AUR packages.
    - Optionally, run `st.sh` to install my patch of the st terminal
1. Run `finalize.sh` to install the system configuration files and other optional packages.
