require('mason-lspconfig').setup_handlers({
  function(name)
    local ok, setup = pcall(require, 'lsp.' .. name)
    if not ok then
      setup = {}
    end
    require('lspconfig')[name].setup(setup)
  end,
})
