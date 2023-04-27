vim.notify = require('notify')
vim.notify.setup({
  render = 'compact',
  stages = 'static',
})

vim.keymap.set('', '<Leader>n', vim.notify.dismiss)
