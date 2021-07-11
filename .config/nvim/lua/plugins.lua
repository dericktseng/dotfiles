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

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function() require('configs/treesitter') end }
  use { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end }
  use { 'iamcco/markdown-preview.nvim', config = function() require('configs/markdown-preview') end, run = 'cd app && yarn install' }
  use { 'hrsh7th/nvim-compe', config = function() require('configs/compe') end }
  use { 'hoob3rt/lualine.nvim', config = function() require('configs/lualine') end }
  use { 'kyazdani42/nvim-web-devicons', opt = true }
  use { 'lervag/vimtex', config = function() require('configs/vimtex') end }
  use 'tpope/vim-fugitive'
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'neovim/nvim-lspconfig'
end)
