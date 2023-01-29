local lspconfig = require("lspconfig")
local mason_lspconnfig = require("mason-lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local utils = require("core.utils")
local lsp_server_config = vim.fn.stdpath("config") .. "/lua/core/lsp/settings"

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "gK", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  debounce_text_changes = 150,
}

-- 设置mason自动安装的lsp server
local mason_lspconnfig_settings = {
  ensure_installed = { "sumneko_lua", "pyright", "clangd" },
  automatic_installation = true,
}

mason_lspconnfig.setup(
  mason_lspconnfig_settings
)

mason_lspconnfig.setup_handlers {
  -- 自动为没有设置 handler 的 lsp server 设置默认 handler
  function(server_name)
    lspconfig[server_name].setup {
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
    }
  end,
}

for _, fname in pairs(vim.fn.readdir(lsp_server_config)) do
  if utils.ends_with(fname, ".lua") then
    local server_config_name = string.sub(fname, 1, #fname - #".lua")
    local server_config_file = "core.lsp.settings." .. server_config_name
    mason_lspconnfig.setup_handlers {
      [server_config_name] = function()
        lspconfig[server_config_name].setup {
          on_attach = on_attach,
          flags = lsp_flags,
          capabilities = capabilities,
          settings = require(server_config_file),

        }
      end
    }
  end
end
