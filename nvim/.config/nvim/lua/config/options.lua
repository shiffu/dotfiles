local options = {

  -- Basic settings
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 4 {default 4}
  scrolloff = 4,                           -- keep 5 lines of buffer on top/bottom while scrolling
  sidescrolloff = 8,
  cmdheight = 0,                           -- space in the neovim command line for displaying messages
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore

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
  list = true,                             -- show trailing "spaces" characters
  listchars = {tab='» ', trail='.', nbsp='␣'},

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

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("YankHighlight", {clear=true}),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank()
    end,
    desc = "Highlight Yank",
})
