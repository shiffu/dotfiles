local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Various Pluging keymaps
keymap("n", "<Leader>e", ":Vex<CR>", opts)
keymap("n", "<Leader>c", ":bd<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Split & Resize Panes
keymap("n", "<Leader>v", ":vsplit<CR>", opts)
keymap("n", "<Leader>s", ":split<CR>", opts)
keymap("n", "<A-j>", ":resize -3<CR>", opts)
keymap("n", "<A-k>", ":resize +3<CR>", opts)
keymap("n", "<A-h>", ":vertical resize -3<CR>", opts)
keymap("n", "<A-l>", ":vertical resize +3<CR>", opts)

-- Navigate buffers
keymap("n", "<C-Right>", ":bnext<CR>", opts)
keymap("n", "<C-Left>", ":bprevious<CR>", opts)
keymap("n", "<Leader><S-c>", ":%bd|e#<CR>", opts)

-- Paste without overriding the current buffer
keymap("v", "p", '"_dP', opts)

-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Quick edit the nvim config
keymap("n", "<Leader>rc", ":e ~/.config/nvim/init.lua<CR>", opts)

keymap("n", "-", "<cmd>Oil --float<CR>", {desc="Open parent dir in Oil"})
