vim.notify = require("notify")
require("mason").setup()
require('plugins/neotree')
require('plugins/lualine')
require("ibl").setup()
require("bufferline").setup{}
require("oil").setup()
require("colorizer").setup()
require("plugins/telescope")
require("plugins/scroll")
require("plugins/noice")
require("plugins/indent")
require("plugins/dashboard")
require("plugins/treesitter")
require("plugins/lsp")
require("plugins/transparent")
--require("plugins/presence")
require("markview").setup({
    modes = { "n", "i", "no", "c" },
    hybrid_modes = { "i" },

    -- This is nice to have
    callbacks = {
        on_enable = function (_, win)
            vim.wo[win].conceallevel = 2;
            vim.wo[win].concealcursor = "nc";
        end
    }
})
