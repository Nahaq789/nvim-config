-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("catppuccin").setup({
	flavour = "auto", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = false, -- disables setting the background color.
	show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
	term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
	dim_inactive = {
		enabled = false, -- dims the background color of inactive window
		shade = "dark",
		percentage = 0.15, -- percentage of the shade to apply to the inactive window
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	no_underline = false, -- Force no underline
	styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
		comments = { "italic" }, -- Change the style of comments
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
		-- miscs = {}, -- Uncomment to turn off hard-coded styles
	},
	color_overrides = {},
	custom_highlights = {},
	default_integrations = true,
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = false,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")

require("toggleterm").setup({
	open_mapping = [[<c-\>]],
	direction = "float",
	start_insert = true,
})

require("lspconfig").gopls.setup({
	settings = {
		gopls = {
			usePlaceholders = false, -- プレースホルダーを無効化
			completionBudget = "500ms", -- 補完の応答時間制限
			matcher = "fuzzy", -- あいまい検索を使用
			staticcheck = true, -- 静的解析を有効化
			analyses = {
				unusedparams = true, -- 未使用パラメータの検出
			},
		},
	},
})

return {
	{
		"hrsh7th/nvim-cmp",
		lazy = false, -- 遅延読み込みを無効化
		priority = 1000, -- 高い優先順位を設定
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
	},
	{
		"zbirenbaum/copilot-cmp",
		dependencies = {
			"zbirenbaum/copilot.lua",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}
