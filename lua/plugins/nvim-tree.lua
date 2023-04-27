require('nvim-tree').setup({
  renderer = {
    special_files = {
      'Cargo.toml',
      'Makefile',
      'README.md',
      'readme.md',
      'go.sum',
      'go.mod',
    },
  },
  filters = {
    dotfiles = false,
    custom = {
      '^\\.git$',
      '^\\.cache$',
      '^.*\\.o$',
    },
  },
  actions = {
    open_file = {
      window_picker = {
        exclude = {
          filetype = {
            "notify",
            "packer",
            "qf",
            "diff",
            "fugitive",
            "fugitiveblame",
            "undotree", -- ignore undotree
          },
          buftype  = { "nofile", "terminal", "help", }
        },
      },
    },
  },
})

local api = require('nvim-tree.api')

vim.keymap.set('n', '<Leader>tf', api.tree.focus)
vim.keymap.set('n', '<Leader>tt', function()
  api.tree.toggle({ focus = true })
end)
vim.keymap.set('n', '<Leader>tl', function()
  api.tree.find_file { open = true, focus = true }
end)

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function(data)
    if vim.fn.isdirectory(data.file) == 1 then
      vim.cmd.cd(data.file)
      require('nvim-tree.api').tree.open()
      vim.api.nvim_exec_autocmds('BufWinEnter', { buffer = vim.fn.bufnr('#') })
    end
  end
})
