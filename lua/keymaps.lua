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

-- Leader key --
vim.g.mapleader = ' '

local setmap = vim.api.nvim_set_keymap
local opts = { noremap = true }

--      ────────────────────────────────────────────────────────────

-- shortcuts --
setmap ('n', '<leader>w', ':w<CR>', {})
setmap ('n', '<leader>q', ':q<CR>', {})
setmap ('n', '<leader>e', ':wq<CR>', {})
setmap ('n', '<leader>x', ':bw<CR>', {})

-- Autocomplete --
-- setmap ('i', '(', '()<Esc>i', opts)
-- setmap ('i', '(<CR>', '(<CR>)<Esc>O', opts)
-- setmap ('i', '{', '{}<Esc>i', opts)
-- setmap ('i', '{<CR>', '{<CR>}<Esc>O', opts)
-- setmap ('i', '[', '[]<Esc>i', opts)
-- setmap ('i', '[<CR>', '[<CR>]<Esc>O', opts)
-- setmap ('i', '<<CR>', '<><Esc>i', opts)
-- setmap ('i', '"', '""<Esc>i', opts)
-- setmap ('i', 'ñ<CR>', '<><Esc>i', opts)

-- Nvim Tree --
setmap ('n', '<leader>t', ':NvimTreeToggle<CR>', opts)

-- Telescope --
setmap ('n', '<leader>ff', ':Telescope find_files<CR>', opts)
setmap ('n', '<leader>fg', ':Telescope file_browser<CR>', opts)
setmap ('n', '<leader>fb', ':Telescope buffers<CR>', opts)
setmap ('n', '<leader>fh', ':Telescope help_tags<CR>', opts)

-- Toggle Term --
setmap ('n', '<leader>v', ':ToggleTerm size=50 direction=vertical<CR>', opts)
setmap ('n', '<leader>f', ':ToggleTerm direction=float<CR>', opts)

-- BufferLine --
setmap ('n', '<leader>n', ':BufferLineCycleNext<CR>', {})
setmap ('n', '<leader>b', ':BufferLineCyclePrev<CR>', {})

-- Comment Box --
-- left aligned fixed size box with left aligned text
setmap("n", "<Leader>bb", "<Cmd>lua require('comment-box').lbox()<CR>", {})
setmap("v", "<Leader>bb", "<Cmd>lua require('comment-box').lbox()<CR>", {})

-- centered adapted box with centered text
setmap("n", "<Leader>bc", "<Cmd>lua require('comment-box').accbox()<CR>", {})
setmap("v", "<Leader>bc", "<Cmd>lua require('comment-box').accbox()<CR>", {})

-- centered line
setmap("n", "<Leader>bl", "<Cmd>lua require('comment-box').cline()<CR>", {})
setmap("i", "<M-l>", "<Cmd>lua require('comment-box').cline()<CR>", {})


