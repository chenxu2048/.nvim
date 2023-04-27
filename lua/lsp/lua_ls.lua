require('lspconfig').lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'use', 'exepath' }, -- for packer use command
      },
      hint = {
        enable = true,
      },
    }
  }
})
