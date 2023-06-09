local M = {}

-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
  bashls = {},
  clangd = {
     capabilities = {
      offsetEncoding = "utf-8"
    }
  },
  cmake = {},
  dockerls = {},
  jsonls = {},
  --sumneko_lua = {},
  --lua_ls = {
  --  Lua = {
  --    workspace = { checkThirdParty = false },
  --    telemetry = { enable = false },
  --  }
  --},
  prosemd_lsp = {},
  pyright = {},
  lemminx = {},
  yamlls = {}
}

local lsp_signature = require "lsp_signature"
lsp_signature.setup {
  bind = true,
  handler_opts = {
    border = "rounded",
  },
}

local function on_attach(client, bufnr)
  -- Enable completion triggered by <C-X><C-O>
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Use LSP as the handler for formatexpr.
  -- See `:help formatexpr` for more information.
  vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

  -- Configure key mappings
  require("config.lsp.keymaps").setup(client, bufnr)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local opts = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

function M.setup()
  require("config.lsp.installer").setup(servers, opts)
end

return M
