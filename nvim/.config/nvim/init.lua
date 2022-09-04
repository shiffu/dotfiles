require("jcp.options")
require("jcp.keymaps")
require("jcp.plugins")
require("jcp.colorscheme")
require("jcp.cmp")
require("jcp.lsp")
require("jcp.treesitter")
require("jcp.telescope")
require("jcp.autopairs")
require("jcp.comment")
require("jcp.nvim-tree")
require("jcp.bufferline")
require("jcp.gitsigns")
require("jcp.lualine")
require("jcp.impatient")
require("jcp.indentline")
require("jcp.alpha")
require("jcp.whichkey")
require("jcp.toggleterm")
require("jcp.autocommands")

-- Activate Treesitter Folding method
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
