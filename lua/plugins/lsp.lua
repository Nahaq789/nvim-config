return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"simrat39/rust-tools.nvim",
		},
		opts = {
			diagnostics = {
				virtual_text = {
					source = "always",
					prefix = "●",
					format = function(diagnostic)
						return string.format("%s (%s)", diagnostic.message, diagnostic.source or "Unknown")
					end,
				},
			},
		},
	},
	-- typos_lsp の設定
	require("lspconfig").typos_lsp.setup({
		init_options = {
			config = "~/.config/nvim/.typos.toml",
		},
	}),
	-- rust-analyzer の設定を修正
	{
		"simrat39/rust-tools.nvim",
		config = function()
			local rt = require("rust-tools")
			rt.setup({
				server = {
					on_attach = function(_, bufnr)
						-- ghを他のキーに変更（既存のghキーマップと競合しているため）
						vim.keymap.set("n", "<leader>rh", rt.hover_actions.hover_actions, { buffer = bufnr })
						vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
					end,
				},
			})
		end,
	},
}
