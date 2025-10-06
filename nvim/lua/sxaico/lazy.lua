-- Migrando a Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({

    -- Búsqueda
    { "nvim-telescope/telescope.nvim", tag = "0.1.2", dependencies = { "nvim-lua/plenary.nvim" } },

    -- Colores
    { "catppuccin/nvim", name = "catppuccin", priority = 1000, lazy = false }, -- activo en arranque
    { "folke/tokyonight.nvim", priority = 1000, lazy = true },                 -- alternativo (opcional)

    -- Treesitter
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    "nvim-treesitter/playground",

    -- Utilidades
    "ThePrimeagen/harpoon",
    "mbbill/undotree",
    "tpope/vim-fugitive",

    -- LSP + autocompletado
    { "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        { "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
        { "j-hui/fidget.nvim" },
    },
},

-- UI
{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
{ "lukas-reineke/indent-blankline.nvim", main = "ibl" },
{ 
"MeanderingProgrammer/render-markdown.nvim",
dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' }, -- if you use standalone mini plugins
-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
---@module 'render-markdown'
---@type render.md.UserConfig
opts = {},
},

-- LaTeX
{ "lervag/vimtex", lazy = false },
{ 
  "aserowy/tmux.nvim",
  config = function()
    require("tmux").setup({
      copy_sync = { enable = false }, -- evita tocar registros/clipboard
      navigation = {
        enable_default_keybindings = true, -- C-h/j/k/l
        cycle_navigation = true,
        persist_zoom = true,
      },
      resize = {
        enable_default_keybindings = true, -- Alt-h/j/k/l
        resize_step_x = 3,
        resize_step_y = 2,
      },
      swap = { enable_default_keybindings = false },
    })
  end
},

{ "lewis6991/gitsigns.nvim", opts = {} },
{ "rcarriga/nvim-notify", opts = { stages = "fade", timeout = 2500 } },



-- Depuración
{ "mfussenegger/nvim-dap", dependencies = { "mfussenegger/nvim-dap-python" } },

-- (Opcional) Obsidian: dejar comentado si no lo usás a diario
-- { "epwalsh/obsidian.nvim", version = "*", ft = "markdown", dependencies = {
    --   "nvim-lua/plenary.nvim", "hrsh7th/nvim-cmp", "nvim-telescope/telescope.nvim", "nvim-treesitter"
    -- } },

})

