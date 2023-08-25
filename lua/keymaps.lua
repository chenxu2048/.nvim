local map = require('utils').mapping.map
local keymaps = require('utils').keymaps

local function desc(desc)
  return { desc = desc }
end
local function clear_register()
  vim.fn.setreg('/', '')
end

keymaps({
  { '<Leader><Esc>', clear_register, desc('clear search register') },
  { '<C-j>',         'gj',           { desc = 'Move GUI line down' } },
  { '<C-k>',         'gk',           { desc = 'Move GUI line up' } },
}, '')
