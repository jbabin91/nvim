local M = {}

function M.installer()
  local nli_status, nli = pcall(require, "nvim-lsp-installer")
  if not nli_status then
    print("'nvim-lsp-installer' not found.")
    return
  end

  nli.setup({
    automatic_installation = true,
  })
end

function M.lsp()
  local lsp_status, lsp = pcall(require, "lspconfig")
  if not lsp_status then
    print("'lspconfig' not found.")
    return
  end

  local function common_on_attach(client, bufnr)
    local keymap = vim.keymap.set
    local opts = { buffer = bufnr }
    if client.name == "tsserver" or client.name == "rust_analyzer" then
      client.resolved_capabilities.document_formatting = false
    end
    keymap("n", "gD", vim.lsp.buf.declaration, opts)
    keymap("n", "gd", vim.lsp.buf.definition, opts)
    keymap('n', 'K', vim.lsp.buf.hover, opts)
    keymap('n', 'gi', vim.lsp.buf.implementation, opts)
    keymap('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    keymap('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    keymap('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    keymap('n', '<leader>wl', function()
      vim.inspect(vim.lsp.buf.list_workspace_folders())
    end, opts)
    keymap('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    keymap('n', '<leader>rn', vim.lsp.buf.rename, opts)
    keymap('n', 'gr', vim.lsp.buf.references, opts)
    keymap({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    keymap('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, opts)
    keymap('n', ']d', vim.diagnostic.goto_next, opts)
    keymap('n', '[d]', vim.diagnostic.goto_prev, opts)
    vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})
  end

  local servers = {
    "rust_analyzer", "pyright", "tsserver", "vimls", "jsonls", "yamlls", "bashls", "dockerls", "sumneko_lua"
  }

  local coq = require("coq")

  local runtime_path = vim.split(package.path, ";")
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")

  for _, server in ipairs(servers) do
    if server == "sumneko_lua" then
      lsp[server].setup(coq.lsp_ensure_capabilities({
        on_attach = common_on_attach,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
              path = runtime_path,
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            }
          },
        },
      }))
    else
      lsp[server].setup(coq.lsp_ensure_capabilities({ on_attach = common_on_attach }))
    end
  end
end


function M.setup(opts)
  local null_ls_status, null_ls = pcall(require, "null-ls")
  if not null_ls_status then
    print("'null-ls' not found.")
    return
  end

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  local code_actions = null_ls.builtins.code_actions
  local hover = null_ls.builtins.hover

  local sources = {
    -- Formatting
    formatting.prettierd,
    formatting.shfmt,
    formatting.fixjson,
    formatting.black.with { extra_args = { "--fast" } },
    formatting.isort,
    formatting.stylua,
    -- formatting.black,
    -- formatting.eslint_d,
    -- formatting.gofmt,

    -- Diagnostics
    diagnostics.write_good,
    -- diagnostics.markdownlint,
    diagnostics.eslint_d,
    diagnostics.flake8,
    diagnostics.tsc,
    -- diagnostics.selene,
    diagnostics.shellcheck,

    -- Code Actions
    code_actions.gitsigns,
    -- code_actions.eslint_d,
    code_actions.gitrebase,
    code_actions.refactoring,

    -- hover
    hover.dictionary,
  }

  null_ls.setup({
    debug = false,
    debounce = 150,
    sources = sources,
    save_after_format = false,
    on_attach = opts.on_attach,
    -- root_dir = nls_utils.root_pattern ".git",
  })
end

function M.init()
  M.installer()
  M.lsp()
end

return M
