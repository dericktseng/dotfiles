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
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path',
      'quangnguyen30192/cmp-nvim-ultisnips',
      'hrsh7th/cmp-calc',
    },
    config = function() require('configs/cmp') end
  }

  use {
    'nvim-telescope/telescope.nvim',
    config = function() require('configs/telescope') end,
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
    config = function() require('configs/treesitter') end 
  }

  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    config = function() require('configs/markdown-preview') end,
    ft = {'markdown'}
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = function() require('configs/lualine') end,
    requires = {'kyazdani42/nvim-web-devicons', opt=true}
  }

  use {
    'blackCauldron7/surround.nvim',
    config = function() require"surround".setup {mappings_style = "surround"} end
  }

  use {
    'lervag/vimtex',
    ft = {'tex', 'latex'},
    config = function() require('configs/vimtex') end,
  }

  use 'windwp/nvim-autopairs'
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-fugitive'
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'junegunn/vim-easy-align'
  use 'onsails/lspkind-nvim'
  use 'neovim/nvim-lspconfig'
end)
