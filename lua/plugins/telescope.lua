local telescope = require('telescope')
local action_layout = require('telescope.actions.layout')
local action_state = require('telescope.actions.state')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local previewers = require('telescope.previewers')

local map = require('utils').mapping.map

local bigger_marker = function(filepath, bufnr, opts)
  opts = opts or {}

  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then
      return
    end
    if stat.size > 100000 then
      return
    else
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end

telescope.load_extension('ui-select')

local function clear_or_close(prompt_bufnr)
  local prompt = vim.api.nvim_buf_get_lines(prompt_bufnr, 0, -1, false)
  local picker = action_state.get_current_picker(prompt_bufnr)
  if #prompt > 0 and prompt[1] ~= picker.prompt_prefix then
    vim.api.nvim_buf_set_lines(prompt_bufnr, 0, -1, false, { picker.prompt_prefix })
    return
  end
  return actions.close(prompt_bufnr)
end

telescope.setup({
  defaults = {
    buffer_previewer_maker = bigger_marker,
    mappings = {
      n = {
        ['<C-p>'] = action_layout.toggle_preview,
        ['<C-n>'] = false,
      },
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-p>'] = action_layout.toggle_preview,
        ['<C-n>'] = false,
        ['<C-c>'] = clear_or_close,
      },
    },
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ['<C-d>'] = actions.delete_buffer + actions.move_to_top,
        },
      },
    },
  },
})

map('<Leader>p', builtin.find_files, { desc = 'Find files' })
map('<Leader>fg', builtin.live_grep, { desc = 'Live search' })
map('<Leader>fb', builtin.buffers, { desc = 'List buffers' })
map('<Leader>fh', builtin.help_tags, { desc = 'List help tags' })
map('<Leader>fm', builtin.keymaps, { desc = 'List keymaps' })
map('<Leader>fr', builtin.reloader, { desc = 'Reload lua' })

telescope.load_extension('notify')
map('<Leader>fn', telescope.extensions.notify.notify, { desc = 'List all notifications' })
