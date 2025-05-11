--[[
-- ╭──────────────────────────────────────────────────────────╮
-- │                                                          │
-- │     .   .                                                │
-- │     |  /                                                 │
-- │     |-'  .-. .  ..--.--. .-.  .,-. .--.                  │
-- │     |  \(.-' |  ||  |  |(   ) |   )`--.                  │
-- │     '   ``--'`--|'  '  `-`-'`-|`-' `--'                  │
-- │                 ;             |                          │
-- │              `-'              '                          │
-- │                                                          │
-- ╰──────────────────────────────────────────────────────────╯
--]]

--? Leader key --
vim.g.mapleader = ' '

local setmap = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- Keybinds --
setmap ('n', '<leader>w', ':w<CR>', {})
setmap ('n', '<leader>q', ':q<CR>', {})
setmap ('n', '<leader>p', ':q!<CR>', {})
setmap ('n', '<leader>e', ':wq<CR>', {})
setmap ('n', '<leader>x', ':bw<CR>', {})

-- Telescope --
setmap ('n', '<leader>ff', ':Telescope find_files<CR>', opts)
setmap ('n', '<leader>fg', ':Telescope file_browser<CR>', opts)
setmap ('n', '<leader>fb', ':Telescope buffers<CR>', opts)
setmap ('n', '<leader>fh', ':Telescope help_tags<CR>', opts)
setmap ('n', '<leader>fn', ':Telescope notify<CR>', opts)

-- NeoTree --
setmap ('n', '<leader>t', ':Neotree<CR>', opts)

-- BufferLine --
setmap ('n', '<leader>l', ':BufferLineCycleNext<CR>', {})
setmap ('n', '<leader>h', ':BufferLineCyclePrev<CR>', {})

-- Aerial --
setmap ('n', '<leader>a', '<cmd>AerialToggle!<CR>', {})

-- Toggle Terminal --
-- Toggle Term --
setmap ('n', '<leader>vt', ':ToggleTerm size=50 direction=vertical<CR>', opts)
setmap ('n', '<leader>ft', ':ToggleTerm direction=float<CR>', opts)

-- oil  File Browser --
setmap ("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Markdown preview --
setmap ('n', '<leader>mp', ':Markview<CR>', {})
