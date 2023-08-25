local hop = require('hop')
hop.setup({})

local directions = require('hop.hint').HintDirection
local utils = require('utils')

local move_forward = utils.bind(hop.hint_char1, { direction = directions.AFTER_CURSOR })
local move_backward = utils.bind(hop.hint_char1, { direction = directions.BEFORE_CURSOR })
local function opt(desc)
  return {
    remap = true,
    desc = desc,
  }
end

utils.keymaps({
  { '<Leader>ef', move_forward,  opt('Move forward') },
  { '<Leader>eb', move_backward, opt('Move backward') },
})
