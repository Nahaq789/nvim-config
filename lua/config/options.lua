-- lua/config/options.lua
vim.opt.modifiable = true
vim.opt.write = true

local opt = vim.opt

-- 基本設定
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.smartindent = true
opt.termguicolors = true
opt.completeopt = "menu,menuone,noselect"

-- Copilot設定
vim.g.copilot_assume_mapped = true

-- 日本語設定
vim.opt.spelllang:append("cjk")  -- vim標準スペルチェックから日本語を除外
vim.opt.helplang = "ja"          -- ヘルプの言語を日本語に設定

-- ウィンドウの透過設定
vim.opt.winblend = 20  -- 初期状態で floating window の透過を有効にする

-- コマンドラインモード時の透過設定
vim.api.nvim_create_autocmd("CmdlineEnter", {
  callback = function()
    vim.opt.winblend = 0  -- 透過効果を無効にする
  end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
  callback = function()
    vim.opt.winblend = 20  -- 透過効果を再び有効にする
  end,
})

-- ウィンドウセパレータの設定
vim.cmd([[
  hi ActiveWindowSeparator guifg=#69F5CD
  hi InactiveWindowSeparator guifg=#555555
]])

-- アクティブウィンドウの枠線設定
vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
  callback = function()
    vim.wo.winhighlight = "WinSeparator:ActiveWindowSeparator"
  end,
})

-- 非アクティブウィンドウの枠線設定
vim.api.nvim_create_autocmd("WinLeave", {
  callback = function()
    -- NeoTreeの場合は変更しない
    local filetype = vim.bo.filetype
    if filetype ~= "neo-tree" then
      vim.wo.winhighlight = ""
    end
  end,
})