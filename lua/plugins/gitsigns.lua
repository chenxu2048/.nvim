local gitsigns = require('gitsigns')
local nmap = require('utils').mapping.nmap
local keymaps = require('utils').keymaps

gitsigns.setup({
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
  },
})

keymaps({
  { '[g',         gitsigns.prev_hunk,           { desc = 'Previous git hunk' } },
  { ']g',         gitsigns.next_hunk,           { desc = 'Next git hunk' } },
  { '<Leader>gh', gitsigns.preview_hunk_inline, { desc = 'Show git hunk' } },
}, 'n')
