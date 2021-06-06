" ale customizations
let g:ale_completion_autoimport = 1

" sign column
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_sign_column_always = 0
let g:ale_set_signs = 1

" when to lint
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1

" loclist and quickfix
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0

" error and warning display
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%severity%] %s [%linter%]'
