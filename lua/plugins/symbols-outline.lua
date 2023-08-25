local outline = require('symbols-outline')

outline.setup({
  auto_close = false,
})

vim.keymap.set('', '<Leader>o', function()
  outline.toggle_outline()
end)
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'Outline',
  callback = function(ev)
    local function noop() end
    vim.keymap.set('', '<C-O>', noop, { buffer = true })
    vim.keymap.set('', '<C-I>', noop, { buffer = true })
  end,
})
