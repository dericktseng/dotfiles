local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- lua plugins
return require('packer').startup(function(use)
  use { 'hrsh7th/nvim-cmp',
    requires = {
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-calc'},
      {'saadparwaiz1/cmp_luasnip'},
    }
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
      {'crispgm/telescope-heading.nvim'},
      {'nvim-telescope/telescope-file-browser.nvim'},
      {'nvim-telescope/telescope-ui-select.nvim' },
    },
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  use {
    'neovim/nvim-lspconfig',
    requires = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim'
    }
  }

  -- use '~/Desktop/program/balance-theme.nvim'
  use 'MetriC-DT/balance-theme.nvim'
  use 'L3MON4D3/LuaSnip'
  use 'nvim-lualine/lualine.nvim'
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
  use 'windwp/nvim-autopairs'
  use 'kylechui/nvim-surround'

  -- non lua plugins
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
  }

  use 'lervag/vimtex'
  use 'tpope/vim-fugitive'
  use 'junegunn/vim-easy-align'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
