vim.notify = require('notify')
vim.notify.setup({
  stages = 'static',
})

local map = require('utils').mapping.map

map('<Leader>n', vim.notify.dismiss, { desc = 'Search notifications' })
