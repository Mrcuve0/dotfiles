local status_ok, scope = pcall(require, "scope")
if not status_ok then
  vim.notify("Error while loading 'scope.lua', returning...")
  return
end

local options = {}

scope.setup(options)
