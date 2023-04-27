require('lualine').setup({
  options = {
    disabled_filetypes = {
      'statusline',
      'winbar',
      'undotree',
      'NvimTree',
      'Outline',
    },
    disabled_buftypes = { 'quickfix', 'prompt' },
  },
})
