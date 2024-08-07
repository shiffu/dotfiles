vim.o.background = "dark"

-- require('material').setup({
--
-- 	contrast = {
-- 		sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
-- 		floating_windows = true, -- Enable contrast for floating windows
-- 		line_numbers = true, -- Enable contrast background for line numbers
-- 		sign_column = false, -- Enable contrast background for the sign column
-- 		cursor_line = true, -- Enable darker background for the cursor line
-- 		non_current_windows = false, -- Enable darker background for non-current windows
-- 		popup_menu = false, -- Enable lighter background for the popup menu
-- 	},
--
-- 	italics = {
-- 		comments = false, -- Enable italic comments
-- 		keywords = false, -- Enable italic keywords
-- 		functions = false, -- Enable italic functions
-- 		strings = false, -- Enable italic strings
-- 		variables = false -- Enable italic variables
-- 	},
--
-- 	contrast_filetypes = { -- Specify which filetypes get the contrasted (darker) background
-- 		"terminal", -- Darker terminal background
-- 		"packer", -- Darker packer background
-- 		"qf" -- Darker qf list background
-- 	},
--
-- 	high_visibility = {
-- 		lighter = false, -- Enable higher contrast text for lighter style
-- 		darker = true -- Enable higher contrast text for darker style
-- 	},
--
-- 	disable = {
-- 		colored_cursor = false, -- Disable the colored cursor
-- 		borders = false, -- Disable borders between verticaly split windows
-- 		background = true, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
-- 		term_colors = false, -- Prevent the theme from setting terminal colors
-- 		eob_lines = false -- Hide the end-of-buffer lines
-- 	},
--
-- 	lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )
--
-- 	async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
--
-- 	custom_highlights = {}, -- Overwrite highlights with your own
--
-- 	plugins = { -- Here, you can disable(set to false) plugins that you don't use or don't want to apply the theme to
-- 		trouble = false,
-- 		nvim_cmp = true,
-- 		neogit = false,
-- 		gitsigns = true,
-- 		git_gutter = false,
-- 		telescope = true,
-- 		nvim_tree = true,
-- 		sidebar_nvim = false,
-- 		lsp_saga = false,
-- 		nvim_dap = false,
-- 		nvim_navic = false,
-- 		which_key = true,
-- 		sneak = false,
-- 		hop = false,
-- 		indent_blankline = true,
-- 		nvim_illuminate = true,
-- 		mini = false,
-- 	}
-- })

-- vim.g.material_style = "darker"
-- vim.cmd 'colorscheme material'

require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")

