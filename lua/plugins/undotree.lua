vim.keymap.set('n', '<Leader>u', vim.cmd.UndotreeToggle)
vim.g.undotree_WindowLayout = 3
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { 'undotree_*' },
  callback = function() end,
})
