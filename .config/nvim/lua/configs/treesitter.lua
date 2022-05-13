require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'c',
    'cpp',
    'css',
    'html',
    'lua',
    'javascript',
    'python',
    'rust',
    'bash'
  },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      node_decremental = "grp",
      scope_incremental = "grs",
    }
  },

  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
    -- colors are in ROYGBIV order
    colors = {
      '#cf2f0d',
      '#8B4513',
      '#df8117',
      '#146439',
      '#0096FF',
      '#00008B',
      '#FF00FF'
    }
  }
}
