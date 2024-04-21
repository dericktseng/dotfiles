if status is-interactive
    # sources all the files in events folder
    for file in ./events/*.fish
        source "$file"
    end

    zoxide init fish | source
end
