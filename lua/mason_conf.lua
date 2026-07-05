--require("mason").setup({
--    ui = {
--        icons = {
--            package_installed = "✓",
--            package_pending = "➜",
--            package_uninstalled = "✗"
--        }
--    }
--})
--
----require("mason-lspconfig").setup {
--vim.lsp.config('mason-lspconfig', {
--    ensure_installed = { "tinymist" },
--    automatic_enable = true--{
--        --exclude = {
--            --"harper-ls"
--        --}
--    --}
--}
--)
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

require("mason-lspconfig").setup({
  ensure_installed = { "html", "cssls", "tinymist", "harper_ls", "matlab_ls" },
  -- easiest: enable all mason-installed servers automatically (default is true)
  automatic_enable = true,

  -- OR: only enable specific ones:
  -- automatic_enable = { "tinymist", "harper_ls" },
})
