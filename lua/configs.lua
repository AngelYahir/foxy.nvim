
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values

local function open_file(filepath)
  vim.api.nvim_command('edit ' .. filepath)
end

local function custom_picker()
  local opts = {
    layout_strategy = 'center',
    layout_config = {
      width = 0.4,  -- Ancho del picker (0.4 es el 40% de la ventana)
      height = 0.3, -- Alto del picker (0.3 es el 30% de la ventana)
    },
  }
  pickers.new(opts, {
    prompt_title = "Custom Config Picker",
    finder = finders.new_table {
      results = {
        { "Open Config File", "init.lua" },
        { "Change Keybinds", "lua/keymaps.lua" },
        { "Select Logo", ":SelectLogo" },
	{ "Select theme", ":PickTheme" },
      },
      entry_maker = function(entry)
        return {
          value = entry[2],
          display = entry[1],
          ordinal = entry[1],
        }
      end,
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        if selection.value == "init.lua" then
          open_file(vim.fn.stdpath("config") .. "/init.lua")
        elseif selection.value == "lua/keymaps.lua" then
          local keybinds_path = vim.fn.stdpath("config") .. "/lua/keymaps.lua"
          if vim.fn.has('win32') == 1 then
            keybinds_path = vim.fn.stdpath("config") .. "\\lua\\keymaps.lua"
          end
          open_file(keybinds_path)
        elseif selection.value == ":SelectLogo" then
          vim.api.nvim_command('SelectLogo')
	elseif selection.value == ":PickTheme" then
	  vim.api.nvim_command('PickTheme')
	end
      end)
      return true
    end,
  }):find()
end

vim.api.nvim_create_user_command('ConfigPicker', function()
  custom_picker()
end, {})
