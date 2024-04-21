function ls_on_cd --on-variable PWD --description 'perform ls when PWD changes'
    status --is-command-substitution; and return
    lscwd
end
