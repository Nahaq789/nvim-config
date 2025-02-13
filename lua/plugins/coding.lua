return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = {
      { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
    },
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      "mason-lspconfig.nvim",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,  -- treesitterとの連携を有効化
      ts_config = {
        lua = { "string" },  -- lua言語でのstring内でのペアを無効化
        javascript = { "template_string" },  -- JSのテンプレート文字列内でのペアを無効化
      },
      disable_filetype = { "TelescopePrompt" },  -- 特定のファイルタイプで無効化
      fast_wrap = {  -- 括弧の後ろに素早く文字を入力できる機能
        map = "<M-e>",  -- Alt+e でfast wrapを起動
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "Search",
        highlight_grey = "Comment"
      },
      -- 自動的にペアにする文字のルール
      pairs_map = {
        ["'"] = "'",
        ['"'] = '"',
        ['('] = ')',
        ['['] = ']',
        ['{'] = '}',
        ['`'] = '`',
      },
      -- 特定の文字の後に自動でスペースを入れる
      enable_afterquote = true,  -- クォートの後にスペースを入れる
      enable_check_bracket_line = true,  -- 行末の括弧を確認
      enable_bracket_in_quote = true,  -- クォート内での括弧を有効化
      enable_abbr = false,  -- 略語展開を無効化
      break_undo = true,  -- ペアを別のundo履歴として扱う
      map_cr = true,  -- Enter時の改行とインデントを有効化
      map_bs = true,  -- Backspaceでペアを一緒に削除
      map_c_h = false,  -- Ctrl+hでのBackspace時の動作を無効化
      map_c_w = false,  -- Ctrl+wでの単語削除時の動作を無効化
    },
    config = function(_, opts)
      local npairs = require("nvim-autopairs")
      npairs.setup(opts)

      -- nvim-cmpとの連携設定
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done()
      )
    end,
  },
}