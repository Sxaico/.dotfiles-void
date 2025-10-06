-- LSP y autocompletado (Nvim 0.11+ sin require('lspconfig').setup)

-- UI de progreso
require("fidget").setup()

-- Instalador de servidores
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "pyright", "marksman", "texlab" },
})

-- Capabilities de nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Helper para definir + activar servers de forma consistente
local function enable_server(name, cfg)
  cfg = cfg or {}
  cfg.capabilities = vim.tbl_deep_extend("force", cfg.capabilities or {}, capabilities)
  vim.lsp.config(name, cfg)   -- define/override config
  vim.lsp.enable(name)        -- activa por filetype
end

-- Servidores (ajusta lo que necesites por server)
enable_server("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace   = { checkThirdParty = false },
    },
  },
})

enable_server("pyright")
enable_server("marksman")
enable_server("texlab")

-- -----------------------------
-- nvim-cmp + luasnip
-- -----------------------------
local luasnip = require "luasnip"
local cmp = require "cmp"

cmp.setup({
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-u>"]   = cmp.mapping.scroll_docs(-4),
    ["<C-d>"]   = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"]    = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    ["<Tab>"]   = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip"  },
  }, {
    { name = "buffer"   },
  }),
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
})

-- cmdline (se configuran FUERA de cmp.setup principal)
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = "buffer" } },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
})

