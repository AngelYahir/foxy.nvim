--[[

     ##############..... ##############
     ##############......##############
       ##########..........##########
       ##########........##########
       ##########.......##########
       ##########.....##########..
       ##########....##########.....
     ..##########..##########.........
   ....##########.#########.............
     ..################JJJ............
       ################.............
       ##############.JJJ.JJJJJJJJJJ
       ############...JJ...JJ..JJ  JJ
       ##########....JJ...JJ..JJ  JJ
       ########......JJJ..JJJ JJJ JJJ
       ######    .........
                   .....
                     .
--]]

local set = vim.opt

set.number = true
set.numberwidth = 1
set.clipboard = 'unnamed'
set.mouse = 'a'
set.encoding = 'utf-8'
set.showmatch = true
set.relativenumber = true
set.laststatus = 2
--set.backspace = 2
--set.noshowmode = true
set.sw = 2
set.ruler = true
set.termguicolors = true

--[[

	┬  ┬ ┬┌─┐  ┌─┐┬┬  ┌─┐┌─┐
	│  │ │├─┤  ├┤ ││  ├┤ └─┐
	┴─┘└─┘┴ ┴  └  ┴┴─┘└─┘└─┘

--]]

require('keymaps')
require('plugins')
require('themes')
require('plugSettings')
