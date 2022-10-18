lua << EOF

vim.lsp.start({
    name = 'python-lsp-server',
    cmd = {'pylsp'},
})
EOF

set number
