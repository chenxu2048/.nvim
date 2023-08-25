local null_ls = require('null-ls')
local nmap = require('utils').mapping.nmap

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.cspell.with({
      diagnostics_postprocess = function(diagnostic)
        diagnostic.severity = vim.diagnostic.severity.HINT
      end,
    }),
    null_ls.builtins.code_actions.cspell,
    null_ls.builtins.formatting.prettier,
  },
})

nmap('<Leader>cA', function()
  vim.lsp.buf.code_action({
    apply = true,
    filter = function(ca)
      return ca.title == 'Add to cspell json file'
    end,
  })
end, {
  desc = 'Add to cspell json file',
})
