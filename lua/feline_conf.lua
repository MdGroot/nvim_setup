local obsession_component = require("obsession_conf")

local components = vim.deepcopy(require("feline.default_components").statusline.icons)

table.insert(components.active[2], 1, obsession_component)
table.insert(components.inactive[1], 1, obsession_component)

require("feline").setup({
    components = components
})
