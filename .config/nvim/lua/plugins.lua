-- lua plugins
return require('packer').startup(function(use)
  use {
    'hrsh7th/nvim-cmp',
    config = function() require('configs.cmp') end,
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-calc',
      'quangnguyen30192/cmp-nvim-ultisnips',
    },
  }

  use {
    'neovim/nvim-lspconfig',
    config = function() require('configs.lspservers') end,
    after = 'nvim-cmp'
  }

  use {
    'windwp/nvim-autopairs',
    config = function() require'configs.pairs' end,
    after = 'nvim-cmp',
    event = 'InsertEnter'
  }

  use {
    'nvim-telescope/telescope.nvim',
    config = function() require('configs.telescope') end,
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
      {'crispgm/telescope-heading.nvim'},
      {'nvim-telescope/telescope-file-browser.nvim'},
    },
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require'configs.treesitter' end,
  }

  use {
    'p00f/nvim-ts-rainbow',
    requires = {
      'nvim-treesitter/nvim-treesitter',
    }
  }

  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    config = function() require'configs.markdown-preview' end,
    ft = {'markdown'}
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = function() require'configs.theme' end,
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require'colorizer'.setup() end,
    ft = {'css', 'javascript', 'lua', 'json', 'vim', 'conf'}
  }

  use {
    'MetriC-DT/balance-theme.nvim',
    config = function() require'configs.theme' end,
  }

  use 'wbthomason/packer.nvim'

  -- non lua plugins
  use {
    'SirVer/ultisnips',
    config = function() require'configs.ultisnips' end,
    requires = { 'honza/vim-snippets' },
  }

  use {
    'lervag/vimtex',
    config = function() require'configs.vimtex' end,
    ft = {'tex'}
  }

  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'junegunn/vim-easy-align'
end)
