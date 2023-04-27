local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.autopep8,
    null_ls.builtins.diagnostics.cspell.with({
      diagnostics_postprocess = function(diagnostic)
        diagnostic.severity = vim.diagnostic.severity.HINT
      end,
    }),
    null_ls.builtins.code_actions.cspell,
    null_ls.builtins.formatting.prettier,
  },
})

vim.keymap.set('n', '<Leader>cA', function()
  vim.lsp.buf.code_action({
    apply = true,
    filter = function(ca)
      return ca.title == 'Add to cspell json file'
    end,
  })
end)
