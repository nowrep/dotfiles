-- NeoVim init.lua

-- Map leader to space
vim.g.mapleader = ' '

-- Load plugins
vim.cmd [[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]]
require 'nw.plugins'

-- Settings
require 'nw.settings'

-- Mappings
require 'nw.mappings'

-- Autocmd rules
require 'nw.autocmd'

-- Misc functions and commands
require 'nw.funcs'
