local telescope = require('telescope.builtin')

local lsp_keymaps = {
  gd = telescope.lsp_definitions,
  gg = vim.lsp.buf.declaration,
  gt = telescope.lsp_type_definitions,
  gi = telescope.lsp_implementations,
  gr = telescope.lsp_references,
  gc = telescope.lsp_incoming_calls,
  gci = telescope.lsp_incoming_calls,
  gco = telescope.lsp_outgoing_calls,
  ce = telescope.diagnostics,
  ca = vim.lsp.buf.code_action,
  ch = vim.lsp.buf.hover,
  cr = vim.lsp.buf.rename,
  cf = vim.lsp.buf.format,
  cx = vim.cmd.LspRestart,
}

local diagnostics = {
  e = vim.diagnostic.severity.ERROR,
  w = vim.diagnostic.severity.WARN,
  h = { max = vim.diagnostic.severity.INFO },
}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }

    for key, func in pairs(lsp_keymaps) do
      vim.keymap.set('', '<Leader>' .. key, func, opts)
    end

    for key, severity in pairs(diagnostics) do
      vim.keymap.set('', '[' .. key, function()
        vim.diagnostic.goto_prev({ severity = severity })
      end, opts)
      vim.keymap.set('', ']' .. key, function()
        vim.diagnostic.goto_next({ severity = severity })
      end, opts)
    end
  end,
})
