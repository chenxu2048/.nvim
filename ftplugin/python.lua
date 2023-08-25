require('utils').enable_auto_format('py')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('PythonLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', '<Leader>co', vim.cmd.PyrightOrganizeImports, opts)
  end,
})
