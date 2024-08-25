-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    --Themes
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {}, },
    { "rebelot/kanagawa.nvim" },

    --Telescope
    { 'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' } },
    {
     "nvim-telescope/telescope-file-browser.nvim",
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    
    -- File menu
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim",
      }
    },

    --Line menu
    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },

    -- Buffer Line
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

    --AutoPair
    {
      'altermo/ultimate-autopair.nvim',
      event={'InsertEnter','CmdlineEnter'},
      branch='v0.6', --recommended as each new version will have breaking changes
      opts={
	  --Config goes here
      },
    },

    -- Notify
    {'rcarriga/nvim-notify'},

    -- Indent line
    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      opts = {},
    },

    -- which key?
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {  },
      keys = {
	{
	  "<leader>?",
	  function()
	    require("which-key").show({ global = false })
	  end,
	  desc = "Buffer Local Keymaps (which-key)",
	},
      },
    },

    -- Scrooooll
    { "karb94/neoscroll.nvim" },
    {
      'stevearc/aerial.nvim',
      opts = {},
      -- Optional dependencies
      dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
      },
    },

    -- Toggle term
    {'akinsho/toggleterm.nvim', version = "*", config = true},

    -- Comments --
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {} 
    },

    -- Noice --
    {
      "folke/noice.nvim",
      event = "VeryLazy",
      opts = {},
      dependencies = {
	"MunifTanjim/nui.nvim",
	"rcarriga/nvim-notify",
      }
    },

    -- Dashboard --
    {
      'nvimdev/dashboard-nvim',
      event = 'VimEnter',
      config = function()
        require('dashboard').setup {}
      end,
      dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },
    -- grupfar --
    {
      'MagicDuck/grug-far.nvim',
      config = function()
        require('grug-far').setup({
          engine =  'astgrep' 
        });
      end
    },
    -- Sorround --
    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup({})
      end
    },

    -- TreeSitter --
    {
      "nvim-treesitter/nvim-treesitter",
      version = false, -- last release is way too old and doesn't work on Windows
      build = ":TSUpdate",
      lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
      init = function(plugin)
        require("lazy.core.loader").add_to_rtp(plugin)
        require("nvim-treesitter.query_predicates")
      end,
      cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
      keys = {
        { "<c-space>", desc = "Increment Selection" },
        { "<bs>", desc = "Decrement Selection", mode = "x" },
      },
    },

    --Copilot --
    { "github/copilot.vim" },

    -- CMP --
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-git",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "windwp/nvim-autopairs",
      },
      event = "VeryLazy",
      main = "plugins.cmp",
      config = true,
    },

    -- Lazy dev --
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "luvit-meta/library", words = { "vim%.uv" } },
        },
      },
    },
    { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
    { -- optional completion source for require statements and module annotations
      "hrsh7th/nvim-cmp",
      opts = function(_, opts)
        opts.sources = opts.sources or {}
        table.insert(opts.sources, {
          name = "lazydev",
          group_index = 0, -- set group index to 0 to skip loading LuaLS completions
        })
      end,
    },

    -- LSP --
    {
      "neovim/nvim-lspconfig",
      dependencies = {
        "williamboman/mason.nvim",  
        { "williamboman/mason-lspconfig.nvim", config = function() end },
      },
    },

    -- oil --
    {
      'stevearc/oil.nvim',
      opts = {},
      dependencies = { { "echasnovski/mini.icons", opts = {} } },
    },
    
    -- toogle transparency --
    { "xiyaowong/transparent.nvim" },

    -- Create new file  --
    { "Mohammed-Taher/AdvancedNewFile.nvim" },

    -- colorizer --
    { "norcalli/nvim-colorizer.lua" },

    -- emmet --
    {
      "olrtg/nvim-emmet",
      config = function()
	vim.keymap.set({ "n", "v" }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)
      end,
    },

    -- Presence --
    { 
      'IogaMaster/neocord',
      event = "VeryLazy"
    },

    -- Markdown preview --
    {
        "OXY2DEV/markview.nvim",
        lazy = false,      -- Recommended
        -- ft = "markdown" -- If you decide to lazy-load anyway

        dependencies = {
            -- You will not need this if you installed the
            -- parsers manually
            -- Or if the parsers are in your $RUNTIMEPATH
            "nvim-treesitter/nvim-treesitter",

            "nvim-tree/nvim-web-devicons"
        }
    }
  },

  -- automatically check for plugin updates
  checker = { enabled = true },
})
