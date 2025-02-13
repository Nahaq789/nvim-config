local keymap = vim.keymap.set
local keydel = vim.keymap.del

local opts = { noremap = true, silent = true }

-- emacs like keybind
keymap("i", "<C-a>", "<Home>", opts)
keymap("i", "<C-e>", "<End>", opts)
keymap("i", "<C-d>", "<Del>", opts)

-- Control + I と Tab をデフォルトの状態に戻す
vim.api.nvim_set_keymap("n", "<C-i>", "<C-i>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-i>", "<C-i>", { noremap = true })

-- Increment / Decrement
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)

-- Select all
keymap("n", "<C-a>", "ggVG")

-- Tab
keymap("n", "<tab>", ":tabnext<Return>", opts)
keymap("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
keymap("n", "ss", ":split<Return>", opts)
keymap("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap("n", "sh", "<C-w>h")
keymap("n", "sk", "<C-w>k")
keymap("n", "sj", "<C-w>j")
keymap("n", "sl", "<C-w>l")
-- Resize window
keymap("n", "<C-w><left>", "<C-w><")
keymap("n", "<C-w><right>", "<C-w>>")
keymap("n", "<C-w><up>", "<C-w>+")
keymap("n", "<C-w><down>", "<C-w>-")

keymap("n", "<C-d>", "5j", opts) -- 5行下に移動
keymap("n", "<C-u>", "5k", opts) -- 5行上に移動
keymap("n", "r", "<C-r>", opts) -- r を redo に割り当て（元の replace 機能を無効化）
keymap("n", "<S-q>", ":tabclose<CR>", opts) -- Shift + q で現在のタブを閉じる
keymap("n", "<F2>", vim.lsp.buf.rename, opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

vim.keymap.set("n", "<M-Up>", ":m .-2<CR>==")
vim.keymap.set("n", "<M-Down>", ":m .+1<CR>==")