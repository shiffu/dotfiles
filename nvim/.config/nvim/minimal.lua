-- Options
local options = {

  -- Basic settings
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 4 {default 4}
  scrolloff = 4,                           -- keep 5 lines of buffer on top/bottom while scrolling
  sidescrolloff = 8,
  cmdheight = 1,                           -- space in the neovim command line for displaying messages
  -- showmode = false,                        -- we don't need to see things like -- INSERT -- anymore

  -- Indentation
  tabstop = 4,                             -- insert 4 spaces for a tab
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  expandtab = true,                        -- convert tabs to spaces
  smartindent = true,                      -- make indenting smarter again

  -- Search
  hlsearch = false,                        -- highlight all matches on previous search pattern
  incsearch = true,                        -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  smartcase = true,                        -- smart case

  -- Visual
  -- cursorcolumn = true,
  -- guifont = "monospace:h17",            -- the font used in graphical neovim applications
  cursorline = true,                       -- highlight the current line
  showtabline = 2,                         -- always show tabs
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  colorcolumn = "120",
  termguicolors = true,                    -- Better colors for colorschemes supporting it (24bits colors)
  pumheight = 10,                          -- pop up menu height
  conceallevel = 0,                        -- so that `` is visible in markdown files
  wrap = true,                             -- wrap lines ?

  -- Completion
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  timeoutlen = 300,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 300,                        -- faster completion (4000ms default)

  -- Behavior
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  mouse = "a",                             -- allow the mouse to be used in neovim
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window

  -- File Explorer

  -- File handling
  fileencoding = "utf-8",                  -- the encoding written to a file
  backup = false,                          -- creates a backup file
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  undofile = true,                         -- enable persistent undo
  swapfile = false,                        -- no swapfile
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

-- Autocommands
vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  augroup _fold
    autocmd!
    autocmd BufReadPost,FileReadPost * normal zR
  augroup end
]]

-- Keymaps
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

-- Colorscheme
-- vim.cmd.colorscheme "default"
vim.cmd.colorscheme "habamax"
-- vim.cmd.colorscheme "unokai"

