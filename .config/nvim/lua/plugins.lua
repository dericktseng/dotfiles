-- plugins
return require('packer').startup(function(use)
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-calc',
      'quangnguyen30192/cmp-nvim-ultisnips',
    },
    config = function() require('configs.cmp') end
  }

  use {
    'nvim-telescope/telescope.nvim',
    config = function() require('configs.telescope') end,
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
      {'crispgm/telescope-heading.nvim'},
    },
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    branch = '0.5-compat',
    run = ':TSUpdate',
    config = function() require('configs.treesitter') end,
    requires = {
      {'p00f/nvim-ts-rainbow'}
    }
  }

  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    config = function() require('configs.markdown-preview') end,
    ft = {'markdown'}
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = function() require('configs.lualine') end,
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  use {
    'blackCauldron7/surround.nvim',
    config = function() require"surround".setup {mappings_style = "surround"} end
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require"colorizer".setup() end,
    ft = {'css', 'javascript', 'lua', 'json', 'vim'}
  }

  use 'MetriC-DT/balance-theme.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'windwp/nvim-autopairs'
  use 'onsails/lspkind-nvim'
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'

  -- non lua plugins
  use 'tpope/vim-fugitive'
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'junegunn/vim-easy-align'
end)
