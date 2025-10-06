-- Selección de esquema de colores (simple y robusto)
local function set_scheme(name, fallback)
  if not pcall(vim.cmd.colorscheme, name) and fallback then
    pcall(vim.cmd.colorscheme, fallback)
  end
end

-- Usar Catppuccin por defecto (mocha está configurado en catppuccin.lua)
set_scheme("catppuccin", "tokyonight")

