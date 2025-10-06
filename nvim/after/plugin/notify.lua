-- Si está instalado, usarlo como backend
local ok, notify = pcall(require, "notify")
if ok then
  vim.notify = notify
end
require("notify").setup({
  background_colour = "#000000",
})
