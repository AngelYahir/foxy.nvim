--[[

  ▄▄▄█████▓ ██░ ██ ▓█████  ███▄ ▄███▓▓█████   ██████
  ▓  ██▒ ▓▒▓██░ ██▒▓█   ▀ ▓██▒▀█▀ ██▒▓█   ▀ ▒██    ▒
  ▒ ▓██░ ▒░▒██▀▀██░▒███   ▓██    ▓██░▒███   ░ ▓██▄
  ░ ▓██▓ ░ ░▓█ ░██ ▒▓█  ▄ ▒██    ▒██ ▒▓█  ▄   ▒   ██▒
    ▒██▒ ░ ░▓█▒░██▓░▒████▒▒██▒   ░██▒░▒████▒▒██████▒▒
    ▒ ░░    ▒ ░░▒░▒░░ ▒░ ░░ ▒░   ░  ░░░ ▒░ ░▒ ▒▓▒ ▒ ░
      ░     ▒ ░▒░ ░ ░ ░  ░░  ░      ░ ░ ░  ░░ ░▒  ░ ░
      ░       ░  ░░ ░   ░   ░      ░      ░   ░  ░  ░
    ░  ░  ░   ░  ░       ░      ░  ░      ░

--]]

local user_config_file = vim.fn.stdpath('config') .. '/user_config.lua'
local user_config = dofile(user_config_file)
vim.cmd('colorscheme ' .. user_config.theme)

function ChangeTheme(new_theme, save)
  vim.cmd('colorscheme ' .. new_theme)
  if save then
    user_config.theme = new_theme
    local config_file = io.open(user_config_file, 'w')
    config_file:write("return " .. vim.inspect(user_config))
    config_file:close()
    vim.notify('Tema cambiado a: ' .. new_theme, vim.log.levels.INFO, { title = "Neovim" })
  end
end

local default_themes = {
  "default", "desert", "elflord", "evening", "industry",
  "koehler", "morning", "murphy", "pablo", "peachpuff",
  "ron", "shine", "slate", "torte", "blue", "darkblue", "delek"
}

function ListThemes()
  local themes = vim.fn.getcompletion('', 'color')
  local filtered_themes = {}

  for _, theme in ipairs(themes) do
    if not vim.tbl_contains(default_themes, theme) then
      table.insert(filtered_themes, theme)
    end
  end

  table.sort(filtered_themes)

  return filtered_themes
end

local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values

function ThemePicker()
  local themes = ListThemes()

  pickers.new({
    layout_config = {
      width = 0.3,
      height = 0.4,
      prompt_position = "top", 
    },
    layout_strategy = "center",
    prompt_title = "Select a theme",
  }, {
    finder = finders.new_table {
      results = themes
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)

      local function preview_theme()
        local selection = action_state.get_selected_entry()
        ChangeTheme(selection[1], false) 
      end

      map('i', '<CR>', function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        ChangeTheme(selection[1], true)
      end)

      map('n', '<CR>', function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        ChangeTheme(selection[1], true)
      end)

      map('i', '<C-j>', function()
        actions.move_selection_next(prompt_bufnr)
        preview_theme()
      end)

      map('i', '<C-k>', function()
        actions.move_selection_previous(prompt_bufnr)
        preview_theme()
      end)

      map('n', 'j', function()
        actions.move_selection_next(prompt_bufnr)
        preview_theme()
      end)

      map('n', 'k', function()
        actions.move_selection_previous(prompt_bufnr)
        preview_theme()
      end)

      map('i', '<Down>', function()
        actions.move_selection_next(prompt_bufnr)
        preview_theme()
      end)

      map('i', '<Up>', function()
        actions.move_selection_previous(prompt_bufnr)
        preview_theme()
      end)

      map('n', '<Down>', function()
        actions.move_selection_next(prompt_bufnr)
        preview_theme()
      end)

      map('n', '<Up>', function()
        actions.move_selection_previous(prompt_bufnr)
        preview_theme()
      end)

      return true
    end,
  }):find()
end

vim.api.nvim_create_user_command('PickTheme', ThemePicker, {})
