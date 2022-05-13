-- lua plugins
return require('packer').startup(function(use)
  use {
    'hrsh7th/nvim-cmp',
    config = function() require('configs.cmp') end,
    requires = {
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-calc'},
      {'saadparwaiz1/cmp_luasnip'},
    }
  }

  use {
    'neovim/nvim-lspconfig',
    config = function() require'configs.lspservers' end,
    after = 'nvim-cmp'
  }

  use {
    'L3MON4D3/LuaSnip',
    config = function()
      require'luasnip'.config.setup({
        update_events = 'TextChanged,TextChangedI',
        region_check_events = "InsertEnter",
        enable_autosnippets = true
      })
      -- files to include
      require'snippets.tex.math'
      require'snippets.tex.general'
      require'snippets.lua'
      require'snippets.shell'
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    config = function() require'configs.telescope' end,
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
    'nvim-lualine/lualine.nvim',
    config = function() require'configs.theme' end,
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require'colorizer'.setup() end,
    ft = {'css', 'javascript', 'lua', 'json', 'vim', 'conf'}
  }

  use {
    'echasnovski/mini.nvim',
    config = function() require'configs.mini' end,
  }

  use {
    'MetriC-DT/balance-theme.nvim',
    config = function() require'configs.theme' end,
  }

  use 'wbthomason/packer.nvim'

  -- non lua plugins
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    config = function() require'configs.markdown-preview' end,
    ft = {'markdown'}
  }

  use {
    'lervag/vimtex',
    config = function() require'configs.vimtex' end,
  }

  use 'tpope/vim-fugitive'
  use 'junegunn/vim-easy-align'
end)
