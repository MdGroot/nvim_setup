require("lspconfig").hls.setup {
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
}

require("lspconfig").clangd.setup {
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
}
