require('toggleterm').setup {
  direction = 'float',
  float_opts = {
    border = 'single',
  },
  start_in_insert = true,
}

local term_group = vim.api.nvim_create_augroup('FloatTerm', {})
vim.api.nvim_create_autocmd('FileType', {
  group = term_group,
  pattern = 'toggleterm',
  callback = function(ev)
    local function noop()
    end
    local function no_arg(f)
      return function() f() end
    end
    local opt = { buffer = ev.buf }
    vim.keymap.set('n', '<C-O>', noop, opt)
    vim.keymap.set('n', '<C-I>', noop, opt)

    vim.keymap.set('n', '<C-X>', no_arg(vim.cmd.ToggleTerm), opt)
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  group = term_group,
  pattern = 'term://*',
  callback = function()
    if vim.bo.buftype == 'terminal' then
      vim.cmd.startinsert()
    end
  end,
})

vim.keymap.set('n', '<Leader>`', ':ToggleTerm<CR>')
vim.keymap.set('t', '<Plug>TermExit', '<C-\\><C-N>')
vim.keymap.set('t', '<C-q><C-q>', '<C-q>')
vim.keymap.set('t', '<C-q><C-x>', '<C-x>')
vim.keymap.set('t', '<C-q>', '<Plug>TermExit', { remap = true })
vim.keymap.set('t', '<C-x>', '<Plug>TermExit:ToggleTerm<CR>', { remap = true })
vim.keymap.set('t', '<M-v>', '<C-\\><C-N>pi')
