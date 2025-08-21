vim.lsp.enable({'clangd'})

vim.diagnostic.config({
    virtual_text = true,
    -- virtual_lines = true,
    underline = true,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    -- Unset 'formatexpr'
    -- vim.bo[args.buf].formatexpr = nil
    -- Unset 'omnifunc'
    -- vim.bo[args.buf].omnifunc = nil

    -- Keys mapping
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references)
  end,
})
