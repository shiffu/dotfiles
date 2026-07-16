return {
  'nvim-treesitter/nvim-treesitter',
  build = function()
    local filetypes = {'bash', 'c', 'lua', 'vim',  'luadoc', 'vimdoc', 'json', 'jsonnet', 'yaml', 'xml', 'go',
                       'python', 'markdown', 'markdown_inline', 'helm', 'html', 'http', 'jinja', 'kcl', 'tcl'}

    require('nvim-treesitter').install(filetypes)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = filetypes,
      callback = function() vim.treesitter.start() end,
    })
  end,
}
