require("telescope").setup {
  defaults = {
    layout_config = {-- Ajusta el alto al 40% de la pantalla
      prompt_position = "top", -- Coloca la barra de búsqueda en la parte superior
    },
  },
  extensions = {
    file_browser = {
      --theme = "ivy",
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"

