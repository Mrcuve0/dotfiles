M = {}

M.server_capabilities = function()
  local active_clients = vim.lsp.get_active_clients()
  local active_client_map = {}

  for index, value in ipairs(active_clients) do
    active_client_map[value.name] = index
  end

  vim.ui.select(vim.tbl_keys(active_client_map), {
    prompt = "Select client:",
    format_item = function(item)
      return "capabilites for: " .. item
    end,
  }, function(choice)
    -- print(active_client_map[choice])
    print(vim.inspect(vim.lsp.get_active_clients()[active_client_map[choice]].server_capabilities.executeCommandProvider))
    vim.pretty_print(vim.lsp.get_active_clients()[active_client_map[choice]].server_capabilities)
  end)
end

-- Load configurations
-- "It's important to setup the plugins in the following order" (see https://github.com/williamboman/mason-lspconfig.nvim)
-- "Mason" is already loaded in 'plugins.lua'
require("user.lsp.mason-lspconfig")
require("user.lsp.lspconfig")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
