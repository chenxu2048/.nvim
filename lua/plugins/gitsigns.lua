local gitsigns = require('gitsigns')

gitsigns.setup({
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
  },
})

vim.keymap.set('n', '[g', gitsigns.prev_hunk, {})
vim.keymap.set('n', ']g', gitsigns.next_hunk, {})
vim.keymap.set('n', '<Leader>gh', gitsigns.preview_hunk_inline, {})
