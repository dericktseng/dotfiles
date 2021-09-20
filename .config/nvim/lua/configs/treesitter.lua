require'nvim-treesitter.configs'.setup {
	ensure_installed = 'maintained',
	highlight = {
		enable = true,
		disable = {
			'latex',
			'bash'
		}
	},

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			node_decremental = "grm",
			scope_incremental = "grc",
		}
	}, 
}
