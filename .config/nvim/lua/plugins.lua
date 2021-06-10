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
  use { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end }
  use { 'hrsh7th/nvim-compe', config = function() require('compeconfig') end }
  use { 'hoob3rt/lualine.nvim', config = function() require('lualineconfig') end }
  use { 'kyazdani42/nvim-web-devicons', opt = true }

  use 'lervag/vimtex'
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'neovim/nvim-lspconfig'
end)
