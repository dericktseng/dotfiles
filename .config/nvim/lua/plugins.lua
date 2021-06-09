-- bootstrapping packer.nvim
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- plugins
return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', ft = 'markdown' }
  use { 'lervag/vimtex', ft = 'tex' , opt = true }
  use { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end }
  use { 'hrsh7th/nvim-compe', config = function() require('compeconfig') end }

  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'itchyny/lightline.vim'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'neovim/nvim-lspconfig'
end)
