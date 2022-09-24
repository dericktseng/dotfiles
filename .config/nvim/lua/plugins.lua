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
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
    }
  }

  -- use '~/Desktop/program/balance-theme.nvim'
  use 'MetriC-DT/balance-theme.nvim'
  use 'L3MON4D3/LuaSnip'
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
  use 'windwp/nvim-autopairs'
  use 'kylechui/nvim-surround'

  -- non lua plugins
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    ft = {'markdown'}
  }

  use 'lervag/vimtex'
  use 'tpope/vim-fugitive'
  use 'junegunn/vim-easy-align'
end)
