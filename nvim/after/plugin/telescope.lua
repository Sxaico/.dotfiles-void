local telescope = require('telescope')

telescope.setup({
  defaults = {
    file_ignore_patterns = { ".git/" },
    mappings = {
      i = {
        ["<C-u>"] = false, -- dejá libre si te molesta en insert mode
        ["<C-d>"] = false,
      },
    },
  },
  pickers = {
    find_files = { hidden = true },        -- ver dotfiles
    git_files  = { show_untracked = true } -- incluye no trackeados
  },
})

local b = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', b.find_files, { desc = 'Telescope: find files' })
vim.keymap.set('n', '<C-p>',      b.git_files,  { desc = 'Telescope: git files' })
vim.keymap.set('n', '<leader>ps', function()
  b.grep_string({ search = vim.fn.input('Grep > ') })
end, { desc = 'Telescope: grep string' })
vim.keymap.set('n', '<leader>pg', b.live_grep,  { desc = 'Telescope: live grep (ripgrep)' })

