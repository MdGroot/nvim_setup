--require('quarto').setup{
--  debug = false,
--  closePreviewOnExit = true,
--  lspFeatures = {
--    enabled = true,
--    chunks = "curly",
--    languages = { "r", "python", "julia", "bash", "html" },
--    diagnostics = {
--      enabled = true,
--      triggers = { "BufWritePost" },
--    },
--    completion = {
--      enabled = true,
--    },
--  },
--  codeRunner = {
--    enabled = true,
--    default_method = "slime", -- "molten", "slime", "iron" or <function>
--    ft_runners = {}, -- filetype to runner, ie. `{ python = "molten" }`.
--    -- Takes precedence over `default_method`
--    never_run = { 'yaml' }, -- filetypes which are never sent to a code runner
--  },
--}

require("quarto").setup({
  lspFeatures = {
    languages = { "python" },
    chunks = "all",
    diagnostics = {
      enabled = true,
      triggers = { "BufWritePost" },
    },
    completion = {
      enabled = true,
    },
  },
  codeRunner = {
    enabled = true,
    default_method = "molten",
  },
})
-- vim.keymap.set("n", "\\rc", "<cmd>QuartoSend<CR>", { silent = true, desc = "Run current notebook cell" })
local runner = require("quarto.runner")

--vim.keymap.set("n", "\\rc", function()
--  runner.run_cell()
--  vim.cmd("redraw!")
--end, { silent = true, desc = "Run current notebook cell" })

vim.keymap.set("n", "\\rc", function()
  runner.run_cell()
  vim.cmd("redraw!")
  vim.defer_fn(function()
    pcall(function()
      vim.cmd("silent! MoltenExportOutput!")
      vim.cmd("silent! write")
      vim.cmd("redraw!")
    end)
  end, 1200)
end, { silent = true, desc = "Run current notebook cell and refresh preview" })

vim.keymap.set("v", "\\rr", "<cmd>QuartoSendRange<CR>", { silent = true, desc = "Run selected lines" })
vim.keymap.set("n", "\\ra", "<cmd>QuartoSendAll<CR>", { silent = true, desc = "Run all notebook cells" })

-- local molten_config_applied = false
-- 
-- local function ensure_molten_config()
--   if molten_config_applied then return end
-- --   if vim.fn.exists("*MoltenUpdateOption") == 0 then return end
-- 
-- -- if vim.fn.exists("*MoltenUpdateOption") == 0 then
-- --   vim.notify("[molten_conf] MoltenUpdateOption is not available yet", vim.log.levels.WARN)
-- --   return
-- -- end
--   vim.fn.MoltenUpdateOption("auto_open_output", true)
--   vim.fn.MoltenUpdateOption("image_provider", "image.nvim")
--   vim.fn.MoltenUpdateOption("wrap_output", true)
--   vim.fn.MoltenUpdateOption("virt_text_output", true)
--   vim.fn.MoltenUpdateOption("virt_lines_off_by_1", true)
--   -- vim.fn.MoltenUpdateOption("auto_init_behavior", "init")
--   -- vim.fn.MoltenUpdateOption("enter_output_behavior", "open_and_enter")
--   vim.fn.MoltenUpdateOption("auto_image_popup", true)
--   vim.fn.MoltenUpdateOption("show_mimetype_debug", false)
-- --   vim.fn.MoltenUpdateOption("output_crop_border", false)
-- --   vim.fn.MoltenUpdateOption("output_virt_lines", true)
-- --   vim.fn.MoltenUpdateOption("output_win_max_height", 50)
-- --   vim.fn.MoltenUpdateOption("output_win_style", "minimal")
-- --   vim.fn.MoltenUpdateOption("output_win_hide_on_leave", false)
-- --   vim.fn.MoltenUpdateOption("virt_text_max_lines", 10000)
-- --   vim.fn.MoltenUpdateOption("cover_empty_lines", false)
-- --   vim.fn.MoltenUpdateOption("copy_output", true)
-- --   vim.fn.MoltenUpdateOption("output_show_exec_time", false)
-- 
--   molten_config_applied = true
--   vim.notify("[molten_conf] Options applied via Quarto runner", vim.log.levels.INFO)
-- end
-- 
-- local quarto = require("quarto")
-- quarto.setup({
--     lspFeatures = {
--         -- NOTE: put whatever languages you want here:
--         enabled = true,
--         languages = { "css", "html", "r", "python", "rust" },
--         chunks = "all",
--         diagnostics = {
--             enabled = true,
--             triggers = { "BufWritePost" },
--         },
--         completion = {
--             enabled = true,
--         },
--     },
--     keymap = {
--         -- NOTE: setup your own keymaps:
--         hover = "H",
--         definition = "gd",
--         rename = "<leader>rn",
--         references = "gr",
--         format = "<leader>gf",
--     },
--     codeRunner = {
--         enabled = true,
--         default_method = "molten",
--     },
-- })
-- 
-- local runner = require("quarto.runner")
-- 
-- vim.keymap.set("n", "<localleader>rc", function()
--   ensure_molten_config()
--   runner.run_cell()
-- end, { desc = "run cell", silent = true })
-- 
-- 
-- vim.keymap.set("n", "<leader>mo", function()
--   local output = vim.api.nvim_exec("MoltenOutput", true)
--   print(output)
-- end)
-- 
-- -- vim.keymap.set("n", "<localleader>rc", runner.run_cell,  { desc = "run cell", silent = true })
-- vim.keymap.set("n", "<localleader>ra", runner.run_above, { desc = "run cell and above", silent = true })
-- vim.keymap.set("n", "<localleader>rA", runner.run_all,   { desc = "run all cells", silent = true })
-- vim.keymap.set("n", "<localleader>rl", runner.run_line,  { desc = "run line", silent = true })
-- vim.keymap.set("v", "<localleader>r",  runner.run_range, { desc = "run visual range", silent = true })
-- vim.keymap.set("n", "<localleader>RA", function()
--   runner.run_all(true)
-- end, { desc = "run all cells of all languages", silent = true })
