require("ibl").setup({
  indent = { char = "│" },
  scope  = { enabled = false }, -- si no te gusta ver el scope resaltado
  exclude = {
    filetypes = { "help", "lazy", "mason", "markdown" },
    buftypes  = { "terminal", "nofile", "quickfix", "prompt" },
  },
})

