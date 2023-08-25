local telescope = require('telescope.builtin')
local map = require('utils').mapping.map

local lsp_keymaps = {
  gd = { telescope.lsp_definitions, 'Go to definition' },
  gg = { vim.lsp.buf.declaration, 'Go to declaration' },
  gt = { telescope.lsp_type_definitions, 'Go to type definition' },
  gi = { telescope.lsp_implementations, 'List implementation' },
  gr = { telescope.lsp_references, 'List references' },
  gc = { telescope.lsp_incoming_calls, 'All incoming calls' },
  gci = { telescope.lsp_incoming_calls, 'All incoming calls' },
  gco = { telescope.lsp_outgoing_calls, 'All outgoing calls' },
  ce = { telescope.diagnostics, 'List diagnostics' },
  ca = { vim.lsp.buf.code_action, 'Code actions' },
  ch = { vim.lsp.buf.hover, 'Hover' },
  cr = { vim.lsp.buf.rename, 'Rename symbol' },
  cf = { vim.lsp.buf.format, 'Format codes' },
  cx = { vim.cmd.LspRestart, 'Restart LSP server' },
  cs = { vim.cmd.LspStart, 'Start LSP server' },
}

local diagnostics = {
  e = vim.diagnostic.severity.ERROR,
  w = vim.diagnostic.severity.WARN,
  h = { max = vim.diagnostic.severity.INFO },
}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    for key, info in pairs(lsp_keymaps) do
      local func = info[1]
      local desc = info[2]
      map('<Leader>' .. key, function()
        func()
      end, { buffer = ev.buf, desc = desc })
    end

    for key, severity in pairs(diagnostics) do
      map('[' .. key, function()
        vim.diagnostic.goto_prev({ severity = severity })
      end, opts)
      map(']' .. key, function()
        vim.diagnostic.goto_next({ severity = severity })
      end, opts)
    end
  end,
})
