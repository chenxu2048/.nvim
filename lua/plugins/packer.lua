local packer = require('packer')

vim.keymap.set('n', '<Leader>xs', packer.sync)
vim.keymap.set('n', '<Leader>xc', packer.compile)
