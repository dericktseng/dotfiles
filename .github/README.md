# Personal Dotfiles

## Installation
1. Execute `curl -L 'https://git.io/JCfgy' | bash`
1. Navigate to `$HOME/.pkglist`
1. Run the `run_all.sh` script (without sudo privileges)
    - `run_all.sh` installs all packages found in `pkglist/` and runs `finalize.sh`
    - if you only want to install packages, run `install.sh`.
    - Optionally, run `st.sh` to install my patch of the st terminal
1. Run `finalize.sh` to install the system configuration files and other optional packages.
