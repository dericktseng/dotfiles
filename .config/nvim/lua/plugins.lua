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
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'quangnguyen30192/cmp-nvim-ultisnips',
      'hrsh7th/cmp-calc',
    },
    config = function() require('configs/cmp') end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    branch = '0.5-compat',
    run = ':TSUpdate',
    config = function() require('configs/treesitter') end 
  }

  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    config = function() require('configs/markdown-preview') end,
  }


  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup() end
  }

  use {
    'hoob3rt/lualine.nvim',
    config = function() require('configs/lualine') end,
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  use { 
    'lervag/vimtex',
    config = function() require('configs/vimtex') end
  }

  use 'tpope/vim-surround'
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-fugitive'
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'junegunn/vim-easy-align'
  use 'neovim/nvim-lspconfig'
end)
