local map = require('utils').mapping.map

map('<Leader><Esc>', function()
  vim.fn.setreg('/', '')
end, { desc = 'clear search register' })
map('<C-j>', 'gj', { desc = 'Move GUI line down' })
map('<C-k>', 'gk', { desc = 'Move GUI line up' })
