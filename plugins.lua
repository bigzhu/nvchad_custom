local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options
  -- override plugin configs

  {
    "jakewvincent/mkdnflow.nvim",
    lazy=false,
    rocks = "luautf8", -- Ensures optional luautf8 dependency is installed
    config = function()
      require("mkdnflow").setup()
    end,
  },
  { -- obsidian
    "epwalsh/obsidian.nvim",
    config = function()
      require("obsidian").setup {
        dir = "~/cheese",
        note_id_func = function(title)
          return title
        end,
      }
    end,
  },
  -- set nvim-tree mappings
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      on_attach = function(bufnr)
        local api = require "nvim-tree.api"

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        vim.keymap.set("n", "l", api.node.open.edit, opts "Edit")
        vim.keymap.set("n", "h", api.node.open.edit, opts "Edit")
        vim.keymap.set("n", "t", api.node.open.tab, opts "Tab")
        vim.keymap.set("n", "?", api.tree.toggle_help, opts "Help")
      end,
    },
  },
  { "github/copilot.vim", lazy = false },
  {
    "akinsho/flutter-tools.nvim",
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.fluttertools"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
