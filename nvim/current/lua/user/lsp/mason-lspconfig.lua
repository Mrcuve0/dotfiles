local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

local M = {}

M.servers = {
  "sumneko_lua",
  "pyright",
  "clangd",
  "dockerls",
}

-- https://github.com/williamboman/mason-lspconfig.nvim
local options = {
  ensure_installed = M.servers,
  automatic_installation = true,
}

-- Load mason_lspconfig's options
mason_lspconfig.setup(options)

return M
