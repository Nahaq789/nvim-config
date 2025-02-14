return {
	-- blink.cmpを無効化
	{ "blink.cmp", enabled = false },

	-- nvim-cmpとその依存プラグインを追加
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			local cmp = require("cmp")
			local has_words_before = function()
				if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
					return false
				end
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
			end
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = {
					["<Tab>"] = vim.schedule_wrap(function(fallback)
						if cmp.visible() and has_words_before() then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
						else
							fallback()
						end
					end),
				},
				-- mapping = cmp.mapping.preset.insert({
				-- 	["<C-n>"] = cmp.mapping.select_next_item(),
				-- 	["<C-p>"] = cmp.mapping.select_prev_item(),
				-- 	["<C-d>"] = cmp.mapping.scroll_docs(-4),
				-- 	["<C-f>"] = cmp.mapping.scroll_docs(4),
				-- 	["<C-Space>"] = cmp.mapping.complete(),
				-- 	["<C-e>"] = cmp.mapping.abort(),
				-- 	["<Tab>"] = function(fallback)
				-- 		if cmp.visible() then
				-- 			cmp.select_next_item()
				-- 		else
				-- 			local copilot_keys = vim.fn["copilot#Accept"]()
				-- 			if copilot_keys ~= "" then
				-- 				vim.api.nvim_feedkeys(copilot_keys, "i", true)
				-- 			else
				-- 				fallback()
				-- 			end
				-- 		end
				-- 	end,
				-- 	["<CR>"] = cmp.mapping.confirm({ select = true }),
				-- }),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
					{ name = "copilot" },
				}),
			})
		end,
	},
}
