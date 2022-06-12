--[[
--                     ╭──────────────────────────────────╮
--                     │                                  │
--                     │ ____  _             _            │
--                     │|  _ \| |_   _  __ _(_)_ __  ___  │
--                     │| |_) | | | | |/ _` | | '_ \/ __| │
--                     │|  __/| | |_| | (_| | | | | \__ \ │
--                     │|_|   |_|\__,_|\__, |_|_| |_|___/ │
--                     │               |___/              │
--                     │                                  │
--                     ╰──────────────────────────────────╯
--]]

vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function()

  use({ "wbthomason/packer.nvim" })
-- ╭──────────────────────────────────────────────────────────╮
-- │    Themes --                                             │
-- ╰──────────────────────────────────────────────────────────╯
  use({
	"catppuccin/nvim",
	as = "catppuccin"
  })

  use 'folke/tokyonight.nvim'

  use "rebelot/kanagawa.nvim"

  use 'EdenEast/nightfox.nvim'

  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    tag = 'v1.*',
    config = function()
        -- vim.cmd('colorscheme rose-pine')
    end
  })

-- ╭──────────────────────────────────────────────────────────╮
-- │    NvimTree --                                           │
-- ╰──────────────────────────────────────────────────────────╯
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    }
  }

-- ╭──────────────────────────────────────────────────────────╮
-- │    Telescope --                                          │
-- ╰──────────────────────────────────────────────────────────╯
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { "nvim-telescope/telescope-file-browser.nvim" }

-- ╭──────────────────────────────────────────────────────────╮
-- │    Toggle Terminal --                                    │
-- ╰──────────────────────────────────────────────────────────╯

  use { "akinsho/toggleterm.nvim" }


-- ╭──────────────────────────────────────────────────────────╮
-- │    LuaLine --                                            │
-- ╰──────────────────────────────────────────────────────────╯
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

-- ╭──────────────────────────────────────────────────────────╮
-- │    Notify --                                             │
-- ╰──────────────────────────────────────────────────────────╯
  use { 'rcarriga/nvim-notify' }

-- ╭──────────────────────────────────────────────────────────╮
-- │    Ident BlackLine --                                    │
-- ╰──────────────────────────────────────────────────────────╯
  use "lukas-reineke/indent-blankline.nvim"

-- ╭──────────────────────────────────────────────────────────╮
-- │    BufferLine --                                         │
-- ╰──────────────────────────────────────────────────────────╯

  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}


-- ╭──────────────────────────────────────────────────────────╮
-- │    Dashboard --                                          │
-- ╰──────────────────────────────────────────────────────────╯
  use {'glepnir/dashboard-nvim'}

-- ╭──────────────────────────────────────────────────────────╮
-- │    Which key --                                          │
-- ╰──────────────────────────────────────────────────────────╯
--   -- Lua
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
-- ╭──────────────────────────────────────────────────────────╮
-- │        your configuration comes here                     │
-- │        or leave it empty to use the default settings     │
-- │        refer to the configuration section below          │
-- ╰──────────────────────────────────────────────────────────╯
      }
    end
  }

-- ╭──────────────────────────────────────────────────────────╮
-- │    Comment beauty --                                     │
-- ╰──────────────────────────────────────────────────────────╯
  use {"LudoPinelli/comment-box.nvim"}

-- ╭──────────────────────────────────────────────────────────╮
-- │    Treesitter --                                         │
-- ╰──────────────────────────────────────────────────────────╯
  use {'nvim-treesitter/nvim-treesitter'}

-- ╭──────────────────────────────────────────────────────────╮
-- │   LSP                                                    │
-- ╰──────────────────────────────────────────────────────────╯
   use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }
  -- CMP --
  use {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp'
  }

  -- lua snip --
  use ({
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    config = function()
      require("luasnip/loaders/from_vscode").load()
    end,
  })

  -- autopairs --
  use {"windwp/nvim-autopairs"}

  --smooth scroll --
  use {
    'karb94/neoscroll.nvim',
    config = function ()
    	require('neoscroll').setup()
    end
  }

  -- minimap --
  -- use {'yavko/minimap.nvim'}

 end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}})

