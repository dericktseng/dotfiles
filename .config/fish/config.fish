if status is-interactive
    # sources all the files in events folder
    for file in $__fish_config_dir/events/*.fish
        source $file
    end

    fish_add_path $HOME/.cargo/bin/
    fish_add_path $HOME/.local/bin/

    /usr/bin/zoxide init fish | source
    /usr/bin/fzf --fish | source
end
