if status is-interactive
    # sources all the files in events folder
    for file in $__fish_config_dir/events/*.fish
        source $file
    end

    /usr/bin/zoxide init fish | source
    /usr/bin/fzf --fish | source
end
