vim.notify = require('notify')
vim.notify.setup({
  stages = 'static',
})

vim.keymap.set('', '<Leader>n', vim.notify.dismiss)
