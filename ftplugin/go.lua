vim.bo.expandtab = false
vim.opt_local.listchars = { tab = '  ', trail = '·', extends = '…', nbsp = '.' }

require('utils').enable_auto_format('go', function()
  vim.lsp.buf.format()
  vim.lsp.buf.code_action({
    context = {
      only = {
        vim.lsp.protocol.CodeActionKind.SourceOrganizeImports,
      },
    },
    apply = true,
  })
end)
