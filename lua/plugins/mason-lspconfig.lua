require('mason-lspconfig').setup_handlers({
  function(name)
    local ok = pcall(require, 'lsp.' .. name)
    if not ok then
      require('lspconfig')[name].setup({})
    else
      vim.notify('load config from "lsp.' .. name .. '"', vim.log.levels.TRACE)
    end
  end,
})
