local path = require('lspconfig/util').path
local root_pattern = require('lspconfig/util').root_pattern

local root_files = {
  'pyproject.toml',
  'setup.py',
  'setup.cfg',
  'requirements.txt',
  'Pipfile',
  'pyrightconfig.json',
  'misc/requirements',
}

local function get_python_path(workspace)
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end
  for _, pattern in ipairs({ '*', '.*' }) do
    local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
    if match ~= '' then
      return path.join(path.dirname(match), 'bin', 'python')
    end
  end
  return exepath('python3') or exepath('python') or 'python'
end

return {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  settings = {
    pyright = {
      inlayHints = {
        functionReturnTypes = true,
        variableTypes = true,
      },
    },
  },
  before_init = function(_, config)
    config.settings.python.pythonPath = get_python_path(config.root_dir)
  end,
  root_dir = root_pattern(root_files),
}
