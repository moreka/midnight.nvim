local M = {}

local loading = false

---@param name? 'midnight'|'daylight'
---@return nil
function M.load(name)
  if loading then
    return
  end
  loading = true

  name = name or 'midnight'

  if vim.g.colors_name then
    vim.cmd('hi clear')
  end

  if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
  end

  vim.o.termguicolors = true
  vim.g.colors_name = name

  local theme = require('midnight.theme')
  theme.apply(name)

  loading = false
end

return M
