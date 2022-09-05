local status_ok, mason = pcall(require, "mason")
if not status_ok then
  vim.notify("Error while loading 'mason.lua', returning...")
  return
end

-- See https://github.com/williamboman/mason.nvim
local options = {

  ui = {
    border = "rounded",
    icons = {
      package_pending = "➜",
      package_installed = "✓",
      package_uninstalled = "✗",
    },

    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 10,
}

-- Load mason's options
mason.setup(options)
