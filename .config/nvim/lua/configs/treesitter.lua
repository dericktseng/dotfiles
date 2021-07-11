require'nvim-treesitter.configs'.setup {
  ensure_installed = {
	  'c',
	  'cpp',
	  'python',
	  'javascript',
	  'latex',
	  'html',
	  'lua'
  },
  highlight = {
    enable = true
  }
}
