local function lsp(name)
  return function()
    require('lsp.' .. name)
  end
end

require('mason-lspconfig').setup_handlers({
  function(server_name)
    require('lspconfig')[server_name].setup({})
  end,
  ['rust_analyzer'] = lsp('rust'),
  ['pyright'] = lsp('python'),
  ['lua_ls'] = lsp('lua'),
  ['gopls'] = lsp('go'),
})
