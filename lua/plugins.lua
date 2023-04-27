return require('packer').startup(function()
  local load = function(name)
    return string.format("require('plugins/%s')", name)
  end
  local setup = function(name)
    return string.format("require('%s').setup()", name)
  end

  use { 'wbthomason/packer.nvim', config = load('packer') }
  use {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = load('hop'),
  }
  use { 'rcarriga/nvim-notify', config = load('nvim-notify') }
  use { 'Mofiqul/vscode.nvim', config = load('vscode') }
  use { 'akinsho/toggleterm.nvim', tag = '*', config = load('toggleterm') }
  use { 'folke/neodev.nvim', config = setup('neodev') }
  use { 'jose-elias-alvarez/null-ls.nvim', config = load('null-ls') }
  use { 'kylechui/nvim-surround', config = setup('nvim-surround') }
  use { 'lewis6991/gitsigns.nvim', config = load('gitsigns') }
  use { 'lvimuser/lsp-inlayhints.nvim', config = load('inlayhints') }
  use { 'neovim/nvim-lspconfig', config = load('nvim-lspconfig') }
  use { 'nvim-lualine/lualine.nvim', config = load('lualine') }
  use { 'nvim-tree/nvim-tree.lua', config = load('nvim-tree') }
  use { 'nvim-tree/nvim-web-devicons' }
  use { 'romgrk/barbar.nvim',
    config = load('barbar'),
    requires = 'nvim-web-devicons',
  }
  use { 'nvim-treesitter/nvim-treesitter', config = load('treesitter') }
  use { 'stevearc/dressing.nvim' }
  use { 'simrat39/symbols-outline.nvim', config = load('symbols-outline') }
  use { 'williamboman/mason.nvim', config = setup('mason') }
  use { 'nvim-telescope/telescope.nvim',
    config = load('telescope'),
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-ui-select.nvim' },
    },
  }
  use { 'hrsh7th/nvim-cmp',
    config = load('cmp-nvim'),
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-vsnip' },
      { 'hrsh7th/vim-vsnip' },
    },
  }

  -- use lua undotree
  use { 'mbbill/undotree', config = load('undotree') }
end)
