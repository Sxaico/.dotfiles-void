require("catppuccin").setup({
  flavour = "mocha",                 -- latte, frappe, macchiato, mocha
  transparent_background = true,     -- sin fondo (respeta tu terminal)
  integrations = {
    treesitter = true,
    cmp = true,
    telescope = true,
    gitsigns = true,
    lualine = true,
    -- nvimtree = true, -- si lo usás
  },
})

