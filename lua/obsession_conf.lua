    local function obsession_status()
        return vim.fn['ObsessionStatus']('Obsession', 'Paused')
    end

    local obsession_component = {
        provider = obsession_status,
        hl = {
            fg = 'green',
            bg = 'bg',
            style = 'bold'
        },
        right_sep = ' '
    }
