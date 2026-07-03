
--require'nvim-treesitter.configs'.setup {
--  ensure_installed = { "css", "html", "r", "python", "markdown", "markdown_inline", "c", "lua", "vim", "vimdoc", "query" },
--  highlight = {
--    enable = true,
--    additional_vim_regex_highlighting = false,
--  },
--  -- ... any other configuration params here ...
--}
local ts = require("nvim-treesitter")

ts.setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

ts.install({
  "c",
  "css",
  "html",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "query",
  "r",
  "vim",
  "vimdoc",
  "typst",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "css", "html", "lua", "markdown", "python", "r", "vim", "typst" },
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})
