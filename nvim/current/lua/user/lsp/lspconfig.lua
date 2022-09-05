-- Inspired by https://github.com/ChristianChiarulli/nvim/blob/master/lua/user/lsp/mason.lua
local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local opts = {}

-- Load the list of servers as defined from 'mason-lspconfig's config file
local servers = require("user.lsp.mason-lspconfig").servers

for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  -- server = vim.split(server, "@")[1]

  -- Load and configure "lua-dev.nvim" 
  if server == "sumneko_lua" then
    local l_status_ok, lua_dev = pcall(require, "lua-dev")
    if not l_status_ok then
      return
    end
    -- local sumneko_opts = require "user.lsp.settings.sumneko_lua"
    -- opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    -- opts = vim.tbl_deep_extend("force", require("lua-dev").setup(), opts)
    local luadev = lua_dev.setup {
      -- add any options here, or leave empty to use the default settings
      lspconfig = {
        on_attach = opts.on_attach,
        capabilities = opts.capabilities,
      },
    }
    lspconfig.sumneko_lua.setup(luadev)
    goto continue
  end

  if server == "pyright" then
    local pyright_options = require("user.lsp.settings.pyright")
    opts = vim.tbl_deep_extend("force", pyright_options, opts)
  end

  if server == "clangd" then
    local clangd_options = require("user.lsp.settings.clangd")
    opts = vim.tbl_deep_extend("force", clangd_options, opts)
  end

  if server == "dockerls" then
    local dockerls_options = require("user.lsp.settings.dockerls")
    opts = vim.tbl_deep_extend("force", dockerls_options, opts)
  end

  lspconfig[server].setup(opts)
  ::continue::
end

-- Enable lua-language-server
-- require'lspconfig'.sumneko_lua.setup {
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'},
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- }
--
-- -- Enable pyright
-- require'lspconfig'.pyright.setup{}
--
-- --Enable clangd
-- require'lspconfig'.clangd.setup{}
