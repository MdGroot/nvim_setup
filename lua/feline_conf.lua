-- Initialize the components table
local components = {
    active = {},
    inactive = {}
}



--
---- Insert three sections (left, mid and right) for the active statusline
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})
--
---- Insert two sections (left and right) for the inactive statusline
table.insert(components.inactive, {})
table.insert(components.inactive, {})

table.insert(components.active[1], {
    provider = function()
        return navic.get_location()
    end,
    enabled = function()
        return navic.is_available()
    end
})

table.insert(components.active[2], obsession_component)
table.insert(components.inactive[2], obsession_component)

  require("feline").setup()

