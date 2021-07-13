local lualine = require 'lualine'

local config =  {
    options = {
        theme = 'wombat'
    },
    extensions = { 'nvim-tree', 'quickfix' }
}

lualine.setup(config)
