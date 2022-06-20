local fn = vim.fn
local db = require('dashboard')

Plugins_count = fn.len(fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))

-- g.dashboard_disable_statusline = 1
db.default_executive = "telescope"

db.custom_header = {
  " 											 ",
  "                                                                                      ",
  "                ░░                                              ░░                    ",
  "                                  ██              ██                                  ",
  "                                ██  ██          ██  ██                                ",
  "                                ██  ░░██      ██░░  ██                                ",
  "                                ██  ░░░░██████░░░░  ██                                ",
  "                                ██  ████░░░░░░████  ██                                ",
  "                                ████░░░░░░░░░░░░░░████                                ",
  "                                ██░░░░░░░░░░░░░░░░░░██                                ",
  "                                ██░░██░░░░░░░░░░██░░██                                ",
  "                              ██░░░░██░░██████░░██░░░░██                              ",
  "     ░░      ░░             ░░██░░░░░░░░  ██  ░░░░░░░░██  ░░            ░░      ░░    ",
  "                   ░░       ██░░░░░░░░          ░░░░░░░░██      ░░                    ",
  "                              ████                  ████                              ",
  "                                  ██████████████████                                  ",
  "                                  ░░      ░░                                          ",
  " 											 ",
  " 											 ",
  " 											 ",
}

db.custom_center = {
  { icon = ' ', desc = 'Find File                 SPC f f', action = "Telescope find_files" },
  { icon = ' ', desc = 'File Browser              SPC f g', action = "Telescope file_browser" },
  { icon = ' ', desc = 'Recents                   SPC f o', action = "Telescope oldfiles" },
  { icon = ' ', desc = 'Find Word                 SPC f w', action = "Telescope live_grep" },
  { icon = ' ', desc = 'New File                  SPC f n', action = "DashboardNewFile" },
  --f = { description = { "  Bookmarks                 SPC b m" }, command = "Telescope marks" },
  --g = { description = { "  Load Last Session         SPC s l" }, command = "SessionLoad" },
}

db.custom_footer = {
  " ",
  " ",
  " ",
  "Foxy.Nvim Loaded " .. Plugins_count .. " plugins!  ",
  "Foxy.Nvim v1.0",
}
