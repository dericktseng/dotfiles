let g:asyncomplete_auto_completeopt = 0

au User asyncomplete_setup call asyncomplete#register_source(
    \ asyncomplete#sources#ale#get_source_options({
    \ 'name': 'ale',
    \ }))

au User asyncomplete_setup call asyncomplete#register_source(
    \ asyncomplete#sources#ultisnips#get_source_options({
    \ 'name': 'ultisnips',
    \ 'allowlist': ['*'],
    \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
    \ }))

au User asyncomplete_setup call asyncomplete#register_source(
    \ asyncomplete#sources#omni#get_source_options({
    \ 'name': 'omni',
    \ 'allowlist': ['tex'],
    \ 'completor': function('asyncomplete#sources#omni#completor'),
    \ 'config': {
    \   'show_source_kind': 1,
    \ },
    \ }))
