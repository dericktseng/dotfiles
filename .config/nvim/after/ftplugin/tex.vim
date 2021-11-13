" sets wrap mode
setlocal wrap
setlocal linebreak
setlocal showbreak=|

" sets conceal
setlocal conceallevel=2

" allow spellchecking
setlocal spell spelllang=en_us

" automatically compile sagetex file in directory
lua << EOF

local sagetexcache = ''

function _G.CompileSage()
  local hasbinary = vim.fn.executable('sage')
  if hasbinary ~= 1 then
    print("No Sage binary installed")
    return
  end

  local filename = vim.fn.expand("%:r")
  filename = filename .. '.sagetex.sage'

  if vim.fn.filereadable(filename) == 1 then
    local contents = vim.fn.readfile(filename)
    contents = table.concat(contents)

    -- if matches cache, then do nothing
    if sagetexcache == contents then
      return
    else
      sagetexcache = contents
      vim.fn.system("sage " .. filename)
    end
  end
end

EOF

" only have these bindings if the sage binary exists.
if executable('sage')
  " autocmd BufWritePost *.tex :call v:lua.CompileSage()
  nnoremap <localleader>lj :call v:lua.CompileSage()<CR>
endif
