-- lua/plugins/ui.lua
return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        -- LSPの進行状況通知を無効化
        progress = {
          enabled = false,
        },
        -- オーバーライド設定
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        -- ホバー設定
        hover = {
          enabled = true,
          silent = true, -- 通知を表示しない
        },
        -- シグネチャヘルプの設定
        signature = {
          enabled = true,
          auto_open = {
            enabled = true,
            trigger = true,
            luasnip = true,
            throttle = 50,
          },
        },
        -- メッセージ設定
        message = {
          enabled = true,
          view = "notify",
          opts = {},
        },
      },
      -- プリセットの設定
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
      -- 通知設定
      notify = {
        enabled = true,
        view = "notify",
        opts = {
          replace = true,
          merge = true,
          level = vim.log.levels.INFO,
        },
      },
      -- コマンドライン設定
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
        opts = {
          position = {
            row = "10%",
            col = "50%",
          },
        },
        format = {
          cmdline = { pattern = "^:", icon = "", lang = "vim" },
          search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
          filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
          lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
          help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
        },
      },
    },
  },

  -- 通知プラグインの設定
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      background_colour = "#000000",
      -- 通知の重要度レベルを上げる（INFO以上のみ表示）
      level = vim.log.levels.INFO,
      -- 通知の表示スタイル
      render = "minimal",
      stages = "fade",
    },
  },
}