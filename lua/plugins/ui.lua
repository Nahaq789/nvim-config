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
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
        opts = {
          -- コマンドラインポップアップの位置を上部に移動
          position = {
            row = "10%", -- 画面上部10%の位置に配置
            col = "50%",
          },
        },
      },
      -- ポップアップの見た目を調整
      views = {
        cmdline_popup = {
          border = {
            style = "single",        -- シングルラインのボーダーに変更
            padding = { 0, 1 },      -- パディングを減らして全体的に小さく
          },
          filter_options = {},
          win_options = {
            winhighlight = {
              Normal = "NormalFloat",
              FloatBorder = "FloatBorder",
            },
          },
          size = {                   -- サイズの調整
            width = "40%",           -- 幅を少し小さく
            height = "auto",         -- 高さは内容に応じて自動調整
          },
        },
        popupmenu = {               -- 補完メニューの設定
          relative = "editor",
          position = {
            row = "13%",            -- コマンドラインの下に表示
            col = "50%",
          },
          size = {
            width = "40%",
            height = "auto",
          },
          border = {
            style = "single",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = {
              Normal = "NormalFloat",
              FloatBorder = "FloatBorder",
            },
          },
        },
      },
      -- その他の設定は維持
      lsp = {
        progress = { enabled = true },
        hover = { enabled = true },
        signature = { enabled = true },
        message = { enabled = true },
      },
      notify = {
        enabled = true,
        view = "notify",
      },
      messages = {
        enabled = true,
        view = "notify",
        view_error = "notify",
        view_warn = "notify",
        view_history = "messages",
        view_search = "virtualtext",
      },
    },
    keys = {
      { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
      { "<leader>nl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
      { "<leader>nh", function() require("noice").cmd("history") end, desc = "Noice History" },
      { "<leader>na", function() require("noice").cmd("all") end, desc = "Noice All" },
      { "<leader>nd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
    },
  },

  -- 通知プラグインの設定も微調整
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 3000,
      -- より控えめなサイズに調整
      max_height = function()
        return math.floor(vim.o.lines * 0.5)  -- 最大高さを50%に
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.5) -- 最大幅を50%に
      end,
      -- 通知の表示位置を上部に
      top_down = true,
      render = "compact",  -- よりコンパクトな表示
      stages = "fade",     -- フェードエフェクト
      background_colour = "#000000",
    },
  },
}