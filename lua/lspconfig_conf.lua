local function current_working_directory(_, on_dir)
    on_dir(vim.fn.getcwd())
end

vim.lsp.log.set_level("OFF")

local navic = require("nvim-navic")

local function attach_navic(client, bufnr)
    if not client.server_capabilities.documentSymbolProvider then
        return
    end

    navic.attach(client, bufnr)

    local navic_redraw_augroup = vim.api.nvim_create_augroup("navic_redraw_ui", { clear = false })
    vim.api.nvim_clear_autocmds({
        buffer = bufnr,
        group = navic_redraw_augroup,
    })
    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "CursorHold" }, {
        callback = function()
            vim.schedule(function()
                pcall(require("winbar.winbar").show_winbar)
                vim.cmd("redrawstatus")
            end)
        end,
        group = navic_redraw_augroup,
        buffer = bufnr,
    })
end

local on_attach = function(client, bufnr)
    attach_navic(client, bufnr)
end

--require("lspconfig").hls.setup {
--    on_attach = function(client, bufnr)
--        navic.attach(client, bufnr)
--    end
--}
vim.lsp.config('hls', {
    filetypes = { 'haskell', 'lhaskell', 'cabal' },
    on_attach = on_attach--function(client, bufnr)
})
--require("lspconfig").hls.setup {
--    on_attach = on_attach--function(client, bufnr)
--}

vim.lsp.config('clangd', {
    cmd = { 'clangd', '--log=error' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
--require("lspconfig").clangd.setup {
    root_dir = current_working_directory,
    on_attach = function(client, bufnr)
        attach_navic(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }

        -- LSP mappings
        buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', '<space>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wl', '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        buf_set_keymap('n', '<space>D', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        buf_set_keymap('n', '<space>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap('n', 'gr', '<Cmd>lua require"telescope.builtin".lsp_references()<CR>', opts)
        buf_set_keymap('n', '<space>e', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
        buf_set_keymap('n', '[d', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
        buf_set_keymap('n', ']d', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
        buf_set_keymap('n', '<space>q', '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
        buf_set_keymap('n', '<space>f', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    end
}
)

vim.lsp.config('tinymist', {
--require("lspconfig").tinymist.setup {
    on_attach = on_attach--function(client, bufnr)
}
)

vim.lsp.config('html', {
    on_attach = on_attach,
})

vim.lsp.config('cssls', {
    on_attach = on_attach,
})

vim.lsp.config('matlab_ls', {
    filetypes = {"matlab"},
    settings = {
      MATLAB = {
        indexWorkspace = true,
        installPath = '/home/maarten/MATLAB/R2024b',
        matlabConnectionTiming = "onStart",
        telemetry = true
      },
    }
}
)

vim.lsp.config('harper_ls', {
--require('lspconfig').harper_ls.setup {
 settings = {
    ["harper-ls"] = {
      userDictPath = "",
      fileDictPath = "",
      linters = {
        SpellCheck = true,
        SpelledNumbers = false,
        AnA = true,
        SentenceCapitalization = true,
        UnclosedQuotes = true,
        WrongQuotes = false,
        LongSentences = true,
        RepeatedWords = true,
        Spaces = true,
        Matcher = true,
        CorrectNumberSuffix = true
      },
      codeActions = {
        ForceStable = false
      },
      markdown = {
        IgnoreLinkTitle = false
      },
      diagnosticSeverity = "hint",
      isolateEnglish = false,
      dialect = "American"
    }
  },
  filetypes = {'typst'},
}
)

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        if client and client:supports_method('textDocument/definition') then
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {
                buffer = ev.buf,
                silent = true,
                desc = 'Go to definition (LSP)',
            })
        end 
    end,
})

vim.lsp.enable({ 'hls', 'clangd', 'tinymist', 'html', 'cssls', 'matlab_ls', 'harper_ls' })

vim.diagnostic.config({
        signs = {
                text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN] = " ",
                        [vim.diagnostic.severity.INFO] = "󰋼 ",
                        [vim.diagnostic.severity.HINT] = "󰌵 ",
                },
                texthl = {
                        [vim.diagnostic.severity.ERROR] = "Error",
                        [vim.diagnostic.severity.WARN] = "Error",
                        [vim.diagnostic.severity.HINT] = "Hint",
                        [vim.diagnostic.severity.INFO] = "Info",
                },
                numhl = {
                        [vim.diagnostic.severity.ERROR] = "",
                        [vim.diagnostic.severity.WARN] = "",
                        [vim.diagnostic.severity.HINT] = "",
                        [vim.diagnostic.severity.INFO] = "",
                },
        },
})
-- require("nvim-treesitter.configs").setup({
--   ensure_installed = { "c", "lua", "vim", "typst" , "python"},
-- })
