require("image").setup({
  backend = "kitty", -- or "ueberzug" or "sixel"
  processor = "magick_cli", -- or "magick_rock"
  integrations = {
    markdown = {
      enabled = true,
      clear_in_insert_mode = false,
      download_remote_images = true,
      only_render_image_at_cursor = false,
      only_render_image_at_cursor_mode = "popup", -- or "inline"
      floating_windows = false, -- if true, images will be rendered in floating markdown windows
      filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
    },
    asciidoc = {
      enabled = true,
      clear_in_insert_mode = false,
      download_remote_images = true,
      only_render_image_at_cursor = false,
      only_render_image_at_cursor_mode = "popup",
      floating_windows = false,
      filetypes = { "asciidoc", "adoc" },
    },
    neorg = {
      enabled = true,
      filetypes = { "norg" },
    },
    rst = {
      enabled = true,
    },
    typst = {
      enabled = true,
      filetypes = { "typst" },
    },
    html = {
      enabled = false,
    },
    css = {
      enabled = false,
    },
  },
  --max_width = nil,
  --max_height = nil,
  --max_width_window_percentage = nil,
  --max_height_window_percentage = 50,
  --window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
  max_width = 100, -- tweak to preference
  max_height = 12, -- ^
  max_height_window_percentage = math.huge, -- this is necessary for a good experience
  max_width_window_percentage = math.huge,
  window_overlap_clear_enabled = true,
  scale_factor = 1.0,
  window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
  editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
  tmux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
  window_overlap_clear_ft_ignore = {
    "cmp_menu",
    "cmp_docs",
    "snacks_notif",
    "scrollview",
    "scrollview_sign",
  },
  hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
})

--require("image").setup({
--      backend = "kitty",
--      integrations = {
--        markdown = {
--          enabled = true,
--          clear_in_insert_mode = false,
--          download_remote_images = true
--        },
--      },
--      editor = {
--        enable = true, -- ✅ this enables rendering inside normal buffers (Molten output)
--      },
--     render_on_bufenter = true, -- optional, but helps
--      max_width = 50,
--      max_height = 10,
--      max_height_window_percentage = math.huge,
--      max_width_window_percentage = math.huge,
--      window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
--      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "noice", "" },
--      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif", "*.PNG" }, -- render image files as images when opened
--    })

require("image").enable()
-- require("image").setup({
--   backend = "kitty",
--   processor = "magick_cli", -- or "magick_rock"
--   integrations = {
--       markdown = {
--           enabled = true,
--             only_render_image_at_cursor = false,
--             only_render_image_at_cursor_mode = "popup",
--             filetypes = { 'markdown', 'vimwiki', 'quarto' },
--           clear_in_insert_mode = false,
--           download_remote_images = true
--         },
--   },
--         editor_only_render_when_focused = false,
--         window_overlap_clear_enabled = true,
--         tmux_show_only_in_active_window = true,
--         max_width = nil,
--         max_height = nil,
--         max_width_window_percentage = nil,
--         max_height_window_percentage = 30,
--         kitty_method = 'normal',
-- })

--    markdown = {
--      enabled = true,
--      clear_in_insert_mode = false,
--      download_remote_images = true,
--      only_render_image_at_cursor = false,
--      only_render_image_at_cursor_mode = "popup",
--      floating_windows = false, -- if true, images will be rendered in floating markdown windows
--      filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
--    },
--    neorg = {
--      enabled = true,
--      filetypes = { "norg" },
--    },
--    typst = {
--      enabled = true,
--      filetypes = { "typst" },
--    },
--    html = {
--      enabled = false,
--    },
--    css = {
--      enabled = false,
--    },



--  max_width = 100,
--  max_height = 12,
--  max_width_window_percentage = math.huge,
--  max_height_window_percentage = math.huge,
--  window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
--  window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", ""},--"snacks_notif", "scrollview", "scrollview_sign" },
  --editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
  --tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
  --hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
-- })

-- require("image").enable()
