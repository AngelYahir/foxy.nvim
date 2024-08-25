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

local powershell_options = {
  shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
  shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellquote = "",
  shellxquote = "",
}

for option, value in pairs(powershell_options) do
  vim.opt[option] = value
end
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
