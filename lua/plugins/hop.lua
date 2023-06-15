local hop = require('hop')
hop.setup({})

local directions = require('hop.hint').HintDirection
vim.keymap.set('', '<Leader>ef', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR })
end, { remap = true })

vim.keymap.set('', '<Leader>eb', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR })
end, { remap = true })
