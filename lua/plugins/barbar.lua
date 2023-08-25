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
local utils = require('utils')

local function opts(desc)
  return {
    buffer = false,
    remap = false,
    desc = desc,
  }
end

utils.keymaps({
  { '<Leader>bp', utils.bind(api.goto_buffer_relative, -1),        opts('Previous buffer') },
  { '<Leader>bn', utils.bind(api.goto_buffer_relative, 1),         opts('Next buffer') },
  { 'gT',         utils.bind(api.goto_buffer_relative, -1),        opts('Previous buffer') },
  { 'gt',         utils.bind(api.goto_buffer_relative, 1),         opts('Next buffer') },
  { '<Leader>b',  utils.bind(api.pick_buffer),                     opts('Select buffer') },
  { '<Leader>bb', utils.bind(api.pick_buffer),                     opts('Select buffer') },
  { '<Leader>bx', utils.bind(api.close_all_but_current_or_pinned), opts('Remove unpinned buffer') },
  { '<Leader>bd', utils.bind(api.pick_buffer_delete),              opts('Remove buffers') },
  { '<Leader>bc', utils.bind(bbye.bdelete, false, 0, {}),          opts('Close current buffer') },
})
