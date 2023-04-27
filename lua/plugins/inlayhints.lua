local highlight = 'LspInlayHint'
local au = '_InlayHintsColorscheme'
local function update_highlight()
  vim.api.nvim_set_hl(0, highlight, { fg = '#6080a0' })
end

require('lsp-inlayhints').setup({
  inlayhints = {
    highlight = highlight,
  },
})

update_highlight()
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup(au, {}),
  pattern = "*",
  callback = update_highlight,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('LspAttachInlayHints', {}),
  callback = function(ev)
    if not (ev.data and ev.data.client_id) then
      return
    end

    local bufnr = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    require('lsp-inlayhints').on_attach(client, bufnr)
  end,
})
