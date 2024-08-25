require("neo-tree").setup({
  event_handlers = {
    {
        event = "file_open_requested",
        handler = function()
	require("neo-tree.command").execute({ action = "close" })
      end
    },
  },
  window = {
    mappings = {
      ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
    }
  }
})
