return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          -- 元のキーマッピングを無効化
          ["[b"] = false,
          ["]b"] = false,

          -- 新しいキーマッピングを設定
          ["<S-h>"] = { "<cmd>bprev<CR>", desc = "Go to previous buffer" },
          ["<S-l>"] = { "<cmd>bnext<CR>", desc = "Go to next buffer" },

          -- 既存の設定も維持
          ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
          ["<Leader>b"] = { desc = "Buffers" },
          ["<C-j>"] = { "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
        },
      },
    },
  },
}
