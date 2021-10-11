require'nvim-treesitter.configs'.setup {
	ensure_installed = 'maintained',
	highlight = {
		enable = true,
		disable = {'latex'},
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
