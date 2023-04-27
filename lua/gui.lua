-- https://www.nerdfonts.com/font-downloads
local fonts = {
  Linux = {
    guifont = { 'FiraCode Nerd Font Mono', 14 },
    guifontwide = { 'Noto Sans CJK SC', 13 },
  },
  Windows = {
    guifont = { 'Consolas NF', 14 },
    guifontwide = { 'Microsoft YaHei', 14 },
  },
  Darwin = {
    guifont = { 'FiraCode Nerd Font Mono', 14 },
    guifontwide = { 'Heiti SC', 14 },
  },
}

local function format_font(font)
  return font[1] .. ':h' .. font[2]
end

vim.o.guifont = format_font(fonts[vim.loop.os_uname().sysname].guifont)
vim.o.guifontwide = format_font(fonts[vim.loop.os_uname().sysname].guifontwide)

if vim.fn.exists(':GuiTabline') == 2 then
  vim.cmd.GuiTabline(0)
  vim.cmd.GuiPopupmenu(0)
  vim.cmd.GuiScrollBar(0)
  vim.cmd.GuiRenderLigatures(1)

  vim.keymap.set('', '<D-f>', function()
    vim.cmd('set g:GuiWindowFullScreen(!g:GuiWindowFullScreen)')
  end)
end
