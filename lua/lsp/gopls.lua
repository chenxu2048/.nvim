return {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  settings = {
    gopls = {
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
  cmd_env = {
    GOOS = 'linux',
    GOARCH = 'amd64',
    CGO_ENABLED = '1',
  },
}
