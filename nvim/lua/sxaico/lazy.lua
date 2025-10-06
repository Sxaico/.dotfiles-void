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

-- LaTeX
{ "lervag/vimtex", lazy = false },

-- Depuración
{ "mfussenegger/nvim-dap", dependencies = { "mfussenegger/nvim-dap-python" } },

-- (Opcional) Obsidian: dejar comentado si no lo usás a diario
-- { "epwalsh/obsidian.nvim", version = "*", ft = "markdown", dependencies = {
    --   "nvim-lua/plenary.nvim", "hrsh7th/nvim-cmp", "nvim-telescope/telescope.nvim", "nvim-treesitter"
    -- } },

})

