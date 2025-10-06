-- Debug Adapter Protocol (DAP) + Python

-- Ruta del venv con debugpy (tu elección)
local dbgpy = vim.fn.expand("~/.virtualenvs/debugpy/bin/python")

-- Aviso amistoso si falta el venv
if vim.fn.executable(dbgpy) == 0 then
  vim.notify("debugpy no encontrado en: " .. dbgpy .. "\nCrealo con:\n  python3 -m venv ~/.virtualenvs/debugpy\n  ~/.virtualenvs/debugpy/bin/pip install -U pip debugpy", vim.log.levels.WARN)
else
  require("dap-python").setup(dbgpy)
end

-- Signos lindos en el gutter (opcional)
vim.fn.sign_define("DapBreakpoint",          { text = "", texthl = "DiagnosticError", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected",  { text = "", texthl = "DiagnosticWarn",  numhl = "" })
vim.fn.sign_define("DapStopped",             { text = "", texthl = "DiagnosticInfo",  numhl = "" })

-- Keymaps globales para DAP (fuera de LspAttach)
local map = vim.keymap.set
map('n', '<F5>',  function() require('dap').continue() end,        { desc = 'DAP: continue' })
map('n', '<F10>', function() require('dap').step_over() end,       { desc = 'DAP: step over' })
map('n', '<F11>', function() require('dap').step_into() end,       { desc = 'DAP: step into' })
map('n', '<F12>', function() require('dap').step_out() end,        { desc = 'DAP: step out' })
map('n', '<leader>b',  function() require('dap').toggle_breakpoint() end, { desc = 'DAP: toggle breakpoint' })
map('n', '<leader>B',  function() require('dap').set_breakpoint() end,    { desc = 'DAP: set breakpoint' })
map('n', '<leader>lp', function()
  require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end, { desc = 'DAP: logpoint' })
map('n', '<leader>dr', function() require('dap').repl.open() end,  { desc = 'DAP: REPL open' })
map('n', '<leader>dl', function() require('dap').run_last() end,   { desc = 'DAP: run last' })
map({ 'n', 'v' }, '<leader>dh', function() require('dap.ui.widgets').hover() end,  { desc = 'DAP: hover' })
map({ 'n', 'v' }, '<leader>dp', function() require('dap.ui.widgets').preview() end,{ desc = 'DAP: preview' })
map('n', '<leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end, { desc = 'DAP: frames' })
map('n', '<leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end, { desc = 'DAP: scopes' })

