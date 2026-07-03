-- require("jupytext").setup({
-- --    style = "quarto",
-- --    output_extension = "qmd",
-- --    force_ft = "quarto",
--     style = "markdown",
--     output_extension = "md",
--     force_ft = "markdown",
-- })
--require("jupytext").setup({
--  style = "markdown",
--  output_extension = "md",
--  force_ft = "markdown",
--})
require("jupytext").setup({
  style = "markdown",
  output_extension = "md",
  force_ft = "markdown",
  custom_language_formatting = {
    python = {
      extension = "md",
      style = "markdown",
      force_ft = "markdown",
    },
  },
})
