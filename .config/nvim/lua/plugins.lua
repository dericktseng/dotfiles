-- packchange build
vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if kind == 'update' or kind == 'install' then
    if name == 'nvim-treesitter' then
      if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
      vim.cmd('TSUpdate'):wait()
    elseif name == 'telescope-fzf-native.nvim' then
      vim.system({ 'make' }, { cwd = ev.data.path }):wait()
    -- elseif name == 'LuaSnip' then
    --   vim.system({ 'make install_jsregexp' }):wait()
    end
  end
end })

-- plugin call
vim.pack.add({
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/OXY2DEV/markview.nvim' },
  { src = 'https://github.com/L3MON4D3/LuaSnip', version = vim.version.range('2.*') },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' }, -- dep for telescope
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-file-browser.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-ui-select.nvim' },
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
  { src = 'https://github.com/nvim-lualine/lualine.nvim' },
  { src = 'https://github.com/windwp/nvim-autopairs' },
  { src = 'https://github.com/kylechui/nvim-surround' },
  { src = 'https://github.com/lervag/vimtex' },
  { src = 'https://github.com/tpope/vim-fugitive' },
  { src = 'https://github.com/MetriC-DT/balance-theme.nvim' },
  { src = 'https://github.com/hrsh7th/nvim-cmp' },
  { src = 'https://github.com/hrsh7th/cmp-buffer' },
  { src = 'https://github.com/hrsh7th/cmp-nvim-lsp' },
  { src = 'https://github.com/hrsh7th/cmp-path' },
  { src = 'https://github.com/hrsh7th/cmp-calc' },
  { src = 'https://github.com/saadparwaiz1/cmp_luasnip' },
})

if vim.o.background == 'light' then require'balance'.setup() end
