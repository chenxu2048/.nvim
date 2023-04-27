local function capitalize(s)
  return s:sub(1, 1):upper() .. s:sub(2)
end

local function enable_auto_format(type, callback)
  local pattern = '*.' .. type
  if callback == nil then
    callback = function(ev)
      vim.lsp.buf.format({
        bufnr = ev.buf,
      })
    end
  end

  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function()
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('LspGroup' .. capitalize(type), {}),
        pattern = pattern,
        callback = callback
      })
    end,
  })
end

local function reload()
  local events_set = {}
  for _, value in ipairs(vim.api.nvim_get_autocmds({})) do
    events_set[value.event] = 1
  end
  local events = {}
  local n = 1
  for event, _ in pairs(events_set) do
    events[n] = event
    n = n + 1
  end
  vim.api.nvim_clear_autocmds({ event = events_set })
  vim.api.nvim_get_keymap('')
end

return {
  enable_auto_format = enable_auto_format,
  capitalize = capitalize,
}
