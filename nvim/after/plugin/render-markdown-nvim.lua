require('render-markdown').setup({
    completions = { lsp = { enabled = true } },
    latex = { enabled = false },  -- <— añade esto
})
