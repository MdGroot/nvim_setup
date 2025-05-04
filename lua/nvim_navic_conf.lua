local navic = require("nvim-navic")

--local on_attach = function(client, bufnr)
--    if client.server_capabilities.documentSymbolProvider then
--        navic.attach(client, bufnr)
--    end
--end

navic.setup {
    icons = {
        File          = "󰈙 ",
        Module        = " ",
        Namespace     = "󰌗 ",
        Package       = " ",
        Class         = "󰌗 ",
        Method        = "󰆧 ",
        Property      = " ",
        Field         = " ",
        Constructor   = " ",
        Enum          = "󰕘",
        Interface     = "󰕘",
        Function      = "󰊕 ",
        Variable      = "󰆧 ",
        Constant      = "󰏿 ",
        String        = "󰀬 ",
        Number        = "󰎠 ",
        Boolean       = "◩ ",
        Array         = "󰅪 ",
        Object        = "󰅩 ",
        Key           = "󰌋 ",
        Null          = "󰟢 ",
        EnumMember    = " ",
        Struct        = "󰌗 ",
        Event         = " ",
        Operator      = "󰆕 ",
        TypeParameter = "󰊄 ",
    },
    lsp = {
        auto_attach = false,
        preference = nil,
    },
    highlight = false,
    separator = " > ",
    depth_limit = 0,
    depth_limit_indicator = "..",
    safe_output = true,
    lazy_update_context = false,
    click = false,
    format_text = function(text)
        return text
    end,
}
--navic.setup {
--    icons = {
--        File          = "󰈙 ",
--        Module        = " ",
--        Namespace     = "󰌗 ",
--        Package       = " ",
--        Class         = "󰌗 ",
--        Method        = "󰆧 ",
--        Property      = " ",
--        Field         = " ",
--        Constructor   = " ",
--        Enum          = "󰕘",
--        Interface     = "󰕘",
--        Function      = "󰊕 ",
--        Variable      = "󰆧 ",
--        Constant      = "󰏿 ",
--        String        = " ",
--        Number        = "󰎠 ",
--        Boolean       = "◩ ",
--        Array         = "󰅪 ",
--        Object        = "󰅩 ",
--        Key           = "󰌋 ",
--        Null          = "󰟢 ",
--        EnumMember    = " ",
--        Struct        = "󰌗 ",
--        Event         = " ",
--        Operator      = "󰆕 ",
--    },
--    highlight = true,
--    separator = " > ",
--    depth_limit = 0,
--    depth_limit_indicator = "..",
--    safe_output = true
--}
--
--on_attach = function(client, bufnr)
--    navic.attach(client, bufnr)
--end
