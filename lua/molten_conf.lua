-- I find auto open annoying, keep in mind setting this option will require setting
-- a keybind for `:noautocmd MoltenEnterOutput` to open the output again
-- vim.g.molten_auto_open_output = false
-- 
-- -- this guide will be using image.nvim
-- -- Don't forget to setup and install the plugin if you want to view image outputs
-- vim.g.molten_image_provider = "image.nvim"
-- 
-- -- optional, I like wrapping. works for virt text and the output window
-- vim.g.molten_wrap_output = true
-- 
-- -- Output as virtual text. Allows outputs to always be shown, works with images, but can
-- -- be buggy with longer images
-- vim.g.molten_virt_text_output = true
-- 
-- -- this will make it so the output shows up below the \`\`\` cell delimiter
-- vim.g.molten_virt_lines_off_by_1 = true
-- 
-- vim.keymap.set("n", "<localleader>e", ":MoltenEvaluateOperator<CR>", { desc = "evaluate operator", silent = true })
-- vim.keymap.set("n", "<localleader>os", ":noautocmd MoltenEnterOutput<CR>", { desc = "open output window", silent = true })
-- these are the same!

vim.g.molten_image_provider = "image.nvim"
vim.g.molten_auto_open_output = true
vim.g.molten_wrap_output = true
vim.g.molten_virt_text_output = false
vim.g.molten_virt_lines_off_by_1 = true
vim.g.molten_output_win_max_height = 20
vim.g.molten_output_virt_lines = true
vim.g.molten_cover_empty_lines = true
vim.g.molten_image_location = "both"
--vim.fn.MoltenUpdateOption("output_win_hide_on_leave", false)
--vim.fn.MoltenUpdateOption("enter_output_behavior", "open_and_enter")

vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>", {
  silent = true,
  desc = "Molten: init kernel",
})

vim.keymap.set("n", "<leader>ml", ":MoltenEvaluateLine<CR>", {
  silent = true,
  desc = "Molten: eval line",
})

vim.keymap.set("v", "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>gv", {
  silent = true,
  desc = "Molten: eval selection",
})

vim.keymap.set("n", "<leader>mr", ":MoltenReevaluateCell<CR>", {
  silent = true,
  desc = "Molten: re-eval cell",
})

vim.keymap.set("n", "<leader>mo", ":noautocmd MoltenEnterOutput<CR>", {
  silent = true,
  desc = "Molten: open output",
})

vim.keymap.set("n", "<leader>mh", ":MoltenHideOutput<CR>", {
  silent = true,
  desc = "Molten: hide output",
})

vim.keymap.set("n", "<leader>md", ":MoltenDelete<CR>", {
  silent = true,
  desc = "Molten: delete cell",
})

--require("molten").init = function()
--    vim.g.molten_auto_open_output = true
--    vim.g.molten_image_provider = "image.nvim"
--    vim.g.molten_wrap_output = true
--    vim.g.molten_virt_text_output = true
--    vim.g.molten_virt_lines_off_by_1 = true
--    vim.g.molten_auto_image_popup = true
--    vim.g.molten_show_mimetype_debug = true
--)


  -- vim.fn.MoltenUpdateOption("auto_init_behavior", "init")
  -- vim.fn.MoltenUpdateOption("enter_output_behavior", "open_and_enter")

-- local function configure_molten()
--   if vim.fn.exists("*MoltenUpdateOption") == 0 then
--     return false -- not ready yet
--   end
-- 
--   vim.fn.MoltenUpdateOption("auto_open_output", false)
--   vim.fn.MoltenUpdateOption("image_provider", "image.nvim")
--   vim.fn.MoltenUpdateOption("auto_init_behavior", "init")
--   vim.fn.MoltenUpdateOption("enter_output_behavior", "open_and_enter")
--   vim.fn.MoltenUpdateOption("auto_image_popup", true)
--   vim.fn.MoltenUpdateOption("output_crop_border", false)
--   vim.fn.MoltenUpdateOption("output_virt_lines", true)
--   vim.fn.MoltenUpdateOption("output_win_max_height", 50)
--   vim.fn.MoltenUpdateOption("output_win_style", "minimal")
--   vim.fn.MoltenUpdateOption("output_win_hide_on_leave", false)
--   vim.fn.MoltenUpdateOption("virt_text_output", true)
--   vim.fn.MoltenUpdateOption("virt_lines_off_by_1", true)
--   vim.fn.MoltenUpdateOption("virt_text_max_lines", 10000)
--   vim.fn.MoltenUpdateOption("cover_empty_lines", false)
--   vim.fn.MoltenUpdateOption("copy_output", true)
--   vim.fn.MoltenUpdateOption("output_show_exec_time", false)
-- 
--   vim.notify("[molten_conf] Molten options applied", vim.log.levels.INFO)
--   return true
-- end
-- 
-- local function setup()
--   -- Try immediately in case kernel is already running
--   if configure_molten() then return end
-- 
--   -- Try every few seconds until success
--   local timer = vim.loop.new_timer()
--   local retries = 0
--   timer:start(1000, 1000, vim.schedule_wrap(function()
--     retries = retries + 1
--     if configure_molten() or retries > 10 then
--       timer:stop()
--       timer:close()
--     end
--   end))
-- end
-- 
-- return {
--   setup = setup
-- }








-- vim.fn.MoltenUpdateOption("auto_open_output", false)
-- vim.fn.MoltenUpdateOption("image_provider", "image.nvim")
-- vim.fn.MoltenUpdateOption("auto_init_behavior", "init")
-- vim.fn.MoltenUpdateOption("enter_output_behavior", "open_and_enter")
-- vim.fn.MoltenUpdateOption("auto_image_popup", true)
-- vim.fn.MoltenUpdateOption("output_crop_border", false)
-- vim.fn.MoltenUpdateOption("output_virt_lines", true)
-- vim.fn.MoltenUpdateOption("output_win_max_height", 50)
-- vim.fn.MoltenUpdateOption("output_win_style", "minimal")
-- vim.fn.MoltenUpdateOption("output_win_hide_on_leave", false)
-- vim.fn.MoltenUpdateOption("virt_text_output", true)
-- vim.fn.MoltenUpdateOption("virt_lines_off_by_1", true)
-- vim.fn.MoltenUpdateOption("virt_text_max_lines", 10000)
-- vim.fn.MoltenUpdateOption("cover_empty_lines", false)
-- vim.fn.MoltenUpdateOption("copy_output", true)
-- vim.fn.MoltenUpdateOption("output_show_exec_time", false)
-- 
-- vim.g.molten_auto_open_output = false
-- vim.g.molten_image_provider = "image.nvim"
-- vim.g.molten_auto_init_behavior = "init"
-- vim.g.molten_enter_output_behavior = "open_and_enter"
-- vim.g.molten_auto_image_popup = false
-- vim.g.molten_output_crop_border = false
-- vim.g.molten_output_virt_lines = true
-- vim.g.molten_output_win_max_height = 50
-- vim.g.molten_output_win_style = "minimal"
-- vim.g.molten_output_win_hide_on_leave = false
-- vim.g.molten_virt_text_output = true
-- vim.g.molten_virt_lines_off_by_1 = true
-- vim.g.molten_virt_text_max_lines = 10000
-- vim.g.molten_cover_empty_lines = false
-- vim.g.molten_copy_output = true
-- vim.g.molten_output_show_exec_time = false
