local present, installer = pcall(require, "nvim-lsp-installer")
if not present then
  return
end

installer.setup({
  automatic_installation = true,
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
nmap("<leader>e", vim.diagnostic.open_float, opts)
nmap("[d", vim.diagnostic.goto_prev, opts)
nmap("]d", vim.diagnostic.goto_next, opts)
nmap("<leader>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for  documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  nmap("gD", vim.lsp.buf.declaration, bufopts)
  nmap("gd", vim.lsp.buf.definition, bufopts)
  nmap("K", vim.lsp.buf.hover, bufopts)
  nmap("gi", vim.lsp.buf.implementation, bufopts)
  nmap("<C-k>", vim.lsp.buf.signature_help, bufopts)
  nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  nmap("<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  nmap("<leader>D", vim.lsp.buf.type_definition, bufopts)
  nmap("<leader>rn", vim.lsp.buf.rename, bufopts)
  nmap("<leader>ca", vim.lsp.buf.code_action, bufopts)
  nmap("gr", vim.lsp.buf.references, bufopts)
  nmap("<leader>bf", vim.lsp.buf.format, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local servers = {
  bashls = {},
  clangd = {},
  golangci_lint_ls = {},
  jsonls = {},
  sumneko_lua = {
    Lua = {
      runtime = {
        -- Tell the language server which version  of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique indentifer
      telemetry = {
        enable = false,
      },
      format = {
        enable = true,
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
        },
      },
    },
  },
  pyright = {},
  vimls = {},
  yamlls = {},
}

local lsp_present, lspconfig = pcall(require, "lspconfig")
if not lsp_present then
  return
end
local coq_present, coq = pcall(require, "coq")
if not coq_present then
  return
end

for lsp, settings in pairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    flags = lsp_flags,
    settings = settings,
    capabilities = coq.lsp_ensure_capabilities(),
  })
end

local null_ls_present, null_ls = pcall(require, "null-ls")
if not null_ls_present then
  return
end
local null_fmt = null_ls.builtins.formatting
local null_diag = null_ls.builtins.diagnostics
local null_act = null_ls.builtins.code_actions

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
  sources = {
    null_fmt.shfmt.with({
      extra_args = { "-i", "2", "-ci", "-bn" }
    }),
    null_fmt.gofmt,
    null_fmt.black,
    null_fmt.isort,
    null_fmt.prettier,
    null_fmt.trim_whitespace,

    null_act.gitsigns,
  },

  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.format({ bufnr = bufnr })
        end
      })
    end
  end
})
