-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
  
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  print("Error loading nvim-tree plugin!")
  return
end

nvim_tree.setup {
    sort_by = "case_sensitive",
    view = {
      width = 40,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
}
