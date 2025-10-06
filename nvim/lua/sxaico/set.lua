local vo = vim.opt

vo.nu = true --muestra los numeros
vo.relativenumber = true --numeros relativos

vo.tabstop = 4 -- el tabstop
vo.softtabstop = 4
vo.shiftwidth = 4
vo.expandtab = true

vo.smartindent = true --indent inteligente

vo.hlsearch = false
vo.incsearch = true

--vo.colorcolumn = '80'

vo.cursorline = true    -- Highlight current line
vo.ruler = true
vo.showmode = false
vo.wrap = true --wrap long lines
vo.linebreak = true --breaklines at words
vo.conceallevel = 1

vo.termguicolors = true

vo.scrolloff = 8 -- Para hacer que el scroll sea 8 lineas arriba/abajo

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    local ok, cmp = pcall(require, "cmp")
    if ok then
      cmp.setup.buffer({ enabled = false })  -- <— SOLO en este buffer
    end
  end,
})

