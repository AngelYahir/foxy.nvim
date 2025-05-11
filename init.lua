--[[
*	 ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ 
*	 ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ 
*	 ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ 
*	 ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ 
*	 ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ 
*	 ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝                                             
--]]


local set = vim.opt
-- that's the best thing 4 clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")

set.number = true
set.numberwidth = 1
set.mouse = 'a'
set.encoding = 'utf-8'
set.showmatch = true
set.relativenumber = true
set.laststatus = 2
set.sw = 2
set.ruler = true
set.termguicolors = true

--[[

	┬  ┬ ┬┌─┐  ┌─┐┬┬  ┌─┐┌─┐
	│  │ │├─┤  ├┤ ││  ├┤ └─┐
	┴─┘└─┘┴ ┴  └  ┴┴─┘└─┘└─┘

--]]

require('keymaps')
require('config.lazy')
require('configs')
require('themes')
require('plugSettings')
