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
    'bash',
    -- 'latex'
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
}
