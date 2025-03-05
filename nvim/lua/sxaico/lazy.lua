-- Migrando a Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
  -- Packer can manage itself
  --'wbthomason/packer.nvim',
    
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim', lazy = true} }
    },

    -- Colorscheme
    {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        transparent = true,
        styles = {
           sidebars = "transparent",
           floats = "transparent"}
        }
    },

    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    -- Las notificaciones flotantes
--    {
--      "folke/noice.nvim",
--      event = "VeryLazy",
--      opts = {
--        -- add any options here
--          -- you can enable a preset for easier configuration
--          presets = {
--            bottom_search = true, -- use a classic bottom cmdline for search
--            command_palette = true, -- position the cmdline and popupmenu together 
--            long_message_to_split = true, -- long messages will be sent to a split
--            inc_rename = false, -- enables an input dialog for inc-rename.nvim
--            lsp_doc_border = true, -- add a border to hover docs and signature help
--  },
--        },
--      dependencies = {
--        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
--        "MunifTanjim/nui.nvim",
--        -- OPTIONAL:
--        --   `nvim-notify` is only needed, if you want to use the notification view.
--        --   If not available, we use `mini` as the fallback
--        "rcarriga/nvim-notify",
--        }
--    },


    -- El treesitter, ver documentación para instalarlo con WSL
    {
        'nvim-treesitter/nvim-treesitter',
    },
    {'nvim-treesitter/playground'},

    -- Categorizar, son útiles
    {'nvim-lua/plenary.nvim'},
    {'ThePrimeagen/harpoon'},
    {'mbbill/undotree'},
    {'tpope/vim-fugitive'},

    {'neovim/nvim-lspconfig',
        dependencies = {
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-cmdline'},
            {'L3MON4D3/LuaSnip',
            -- follow latest release.
            version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!).
            build = "make install_jsregexp"
            },
            {"j-hui/fidget.nvim",
              opts = {
                -- options
              },
            }
        },
    },
    -- La barra de estado de nvim
    {
          'nvim-lualine/lualine.nvim',
          dependencies = { 'nvim-tree/nvim-web-devicons'},
          opts = {
              theme = 'auto'
          }
    },

    -- Ver que onda Tmux con nvim
    {
          "aserowy/tmux.nvim",
          config = function() return require("tmux").setup() end
    },
    {'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts= {}},-- Las lineas de la izquierda que dicen donde esta el indent

    { 'lervag/vimtex',
    lazy = false,
    },

        -- Para configurar con obsidian, no sé si usarlo
    {"epwalsh/obsidian.nvim",
      version = "*",  -- recommended, use latest release instead of latest commit
      lazy = true,
      ft = "markdown",
      dependencies = {
          'nvim-lua/plenary.nvim',
          'hrsh7th/nvim-cmp',
          'nvim-telescope/telescope.nvim',
          'nvim-treesitter'
      }
      -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
      -- event = {
      --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
      --   "BufReadPre path/to/my-vault/**.md",
      --   "BufNewFile path/to/my-vault/**.md",
      -- },
    },

    {'mfussenegger/nvim-dap',
        dependencies = {
            'mfussenegger/nvim-dap-python',
    },
},
 })
