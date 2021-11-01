" stolen functions from vimtex
function! Syntax_stack(...) abort " {{{1
  let l:pos = a:0 > 0 ? [a:1, a:2] : [line('.'), col('.')]
  if mode() ==# 'i'
    let l:pos[1] -= 1
  endif
  call map(l:pos, 'max([v:val, 1])')

  return map(synstack(l:pos[0], l:pos[1]), "synIDattr(v:val, 'name')")
endfunction

" checks whether we are in a math zone (for use for ultisnips snippets)
function! Syntax_in_mathzone(...) abort " {{{1
  let l:ids = reverse(call('Syntax_stack', a:000))
  let l:index = match(l:ids, '^texMath\%(Zone\|Text\)')
  return l:index >= 0
        \ && match(l:ids[l:index], '^texMathText') == -1
endfunction
