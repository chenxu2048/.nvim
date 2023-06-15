local gitsigns = require('gitsigns')
local nmap = require('utils').mapping.nmap

gitsigns.setup({
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
  },
})

nmap('[g', gitsigns.prev_hunk, { desc = 'Previous git hunk' })
nmap(']g', gitsigns.next_hunk, { desc = 'Next git hunk' })
nmap('<Leader>gh', gitsigns.preview_hunk_inline, { desc = 'Show git hunk' })
