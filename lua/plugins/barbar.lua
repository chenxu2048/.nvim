vim.g.barbar_auto_setup = false
require('barbar').setup({
  sidebar_filetypes = {
    NvimTree = true,
    undotree = { text = 'undotree' },
    Outline = { event = 'BufWinLeave', text = 'symbols-outline' },
  },
  no_name_title = nil,
})

local api = require('barbar.api')
local bbye = require('barbar.bbye')
local opts = { buffer = false, remap = false }
local map = vim.keymap.set

map('', '<Leader>bp', function() api.goto_buffer_relative(-1) end, opts)
map('', '<Leader>bn', function() api.goto_buffer_relative(1) end, opts)
map('', 'gT', function() api.goto_buffer_relative(-1) end, opts)
map('', 'gt', function() api.goto_buffer_relative(1) end, opts)
map('', '<Leader>b', function() api.pick_buffer() end, opts)
map('', '<Leader>bb', function() api.pick_buffer() end, opts)
map('', '<Leader>bx', function() api.close_all_but_current_or_pinned() end, opts)
map('', '<Leader>bc', function() bbye.bdelete(false, vim.api.nvim_get_current_buf(), {}) end, opts)
map('', '<Leader>bd', function() api.pick_buffer_delete() end, opts)
