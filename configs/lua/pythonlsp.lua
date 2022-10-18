--run the python language server
vim.lsp.start({
    name = 'python-lsp-server',
    cmd = {'pylsp'},
})

-- not sure how this works, yet?
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        vim.keymap.set('n', 'M', vim.lsp.buf.definition)
    end,
})
