local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  vim.notify("Error while loading 'which-key', returning...")
end

local options = {

}

-- Load which-key's options
wk.setup(options)
