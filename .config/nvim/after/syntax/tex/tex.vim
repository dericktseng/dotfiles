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

" other conceal commands
syn match texMathSymbol '&=' contained conceal cchar==

" custom conceal commands
syn match texMathSymbol '\\Rightarrow\>' contained conceal cchar=⇒
syn match texMathSymbol '\\Leftarrow\>' contained conceal cchar=⇐
syn match texMathSymbol '\\rightarrow\>' contained conceal cchar=→
syn match texMathSymbol '\\leftarrow\>' contained conceal cchar=←
syn match texMathSymbol '\\emptyset\>' contained conceal cchar=Ø
syn match texMathSymbol '\\varphi\>' contained conceal cchar=φ
syn match texMathSymbol '\\phi\>' contained conceal cchar=Φ
syn match texMathSymbol '\\langle\>\s*' contained conceal cchar=⟨
syn match texMathSymbol '\s*\\rangle\>' contained conceal cchar=⟩

" logical symbols
syn match texMathSymbol '\\lor\>' contained conceal cchar=∨
syn match texMathSymbol '\\land\>' contained conceal cchar=∧
syn match texMathSymbol '\\lnot\>' contained conceal cchar=¬
syn match texMathSymbol '\\implies\>' contained conceal cchar=⇒
syn match texMathSymbol '\\geqslant\>' contained conceal cchar=⩾
syn match texMathSymbol '\\leqslant\>' contained conceal cchar=⩽

" \mathbb characters
syn match texMathSymbol '\\mathbb{\s*A\s*}' contained conceal cchar=𝔸
syn match texMathSymbol '\\mathbb{\s*B\s*}' contained conceal cchar=𝔹
syn match texMathSymbol '\\mathbb{\s*C\s*}' contained conceal cchar=ℂ
syn match texMathSymbol '\\mathbb{\s*D\s*}' contained conceal cchar=𝔻
syn match texMathSymbol '\\mathbb{\s*E\s*}' contained conceal cchar=𝔼
syn match texMathSymbol '\\mathbb{\s*F\s*}' contained conceal cchar=𝔽
syn match texMathSymbol '\\mathbb{\s*G\s*}' contained conceal cchar=𝔾
syn match texMathSymbol '\\mathbb{\s*H\s*}' contained conceal cchar=ℍ
syn match texMathSymbol '\\mathbb{\s*I\s*}' contained conceal cchar=𝕀
syn match texMathSymbol '\\mathbb{\s*J\s*}' contained conceal cchar=𝕁
syn match texMathSymbol '\\mathbb{\s*K\s*}' contained conceal cchar=𝕂
syn match texMathSymbol '\\mathbb{\s*L\s*}' contained conceal cchar=𝕃
syn match texMathSymbol '\\mathbb{\s*M\s*}' contained conceal cchar=𝕄
syn match texMathSymbol '\\mathbb{\s*N\s*}' contained conceal cchar=ℕ
syn match texMathSymbol '\\mathbb{\s*O\s*}' contained conceal cchar=𝕆
syn match texMathSymbol '\\mathbb{\s*P\s*}' contained conceal cchar=ℙ
syn match texMathSymbol '\\mathbb{\s*Q\s*}' contained conceal cchar=ℚ
syn match texMathSymbol '\\mathbb{\s*R\s*}' contained conceal cchar=ℝ
syn match texMathSymbol '\\mathbb{\s*S\s*}' contained conceal cchar=𝕊
syn match texMathSymbol '\\mathbb{\s*T\s*}' contained conceal cchar=𝕋
syn match texMathSymbol '\\mathbb{\s*U\s*}' contained conceal cchar=𝕌
syn match texMathSymbol '\\mathbb{\s*V\s*}' contained conceal cchar=𝕍
syn match texMathSymbol '\\mathbb{\s*W\s*}' contained conceal cchar=𝕎
syn match texMathSymbol '\\mathbb{\s*X\s*}' contained conceal cchar=𝕏
syn match texMathSymbol '\\mathbb{\s*Y\s*}' contained conceal cchar=𝕐
syn match texMathSymbol '\\mathbb{\s*Z\s*}' contained conceal cchar=ℤ

syn match texDelimiter '\\{' contained conceal cchar={
syn match texDelimiter '\\}' contained conceal cchar=}
syn match texMathSymbol '\\setminus\>' contained conceal cchar=\
syn match texMathSymbol '\\coloneqq\>' contained conceal cchar=≔
syn match texMathSymbol '\\colon\>' contained conceal cchar=:
syn match texMathSymbol '\\:' contained conceal cchar= 
syn match texMathSymbol '\\;' contained conceal cchar= 
syn match texMathSymbol '\\,' contained conceal cchar= 
syn match texMathSymbol '\\ ' contained conceal cchar= 
syn match texMathSymbol '\\quad' contained conceal cchar=  
syn match texMathSymbol '\\qquad' contained conceal cchar=    
syn match texMathSymbol '\\sqrt' contained conceal cchar=√
syn match texMathSymbol '\\sqrt\[3]' contained conceal cchar=∛
syn match texMathSymbol '\\sqrt\[4]' contained conceal cchar=∜
syn match texMathSymbol '\\\!' contained conceal
syn match texMathSymbol '\\therefore' contained conceal cchar=∴
syn match texMathSymbol '\\because' contained conceal cchar=∵
