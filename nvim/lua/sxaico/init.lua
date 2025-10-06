require('sxaico.remap')
require('sxaico.set')
require('sxaico.lazy')
-- en lua/sxaico/init.lua
-- print('Hello sxaico')  -- quitar

vim.schedule(function()
  vim.notify("Bienvenido, sxaico 👋", vim.log.levels.INFO, { title = "nvim" })
end)


