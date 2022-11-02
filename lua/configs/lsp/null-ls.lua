local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/prettier-solidity/prettier-plugin-solidity
null_ls.setup({
  debug = false,
  sources = {
    -- formatting.prettier.with({
    --   extra_filetypes = { "toml" },
    --   extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    -- }),
    formatting.prettierd,
    formatting.prismaFmt,
    -- formatting.black.with({ extra_args = { "--fast" }}),
    formatting.stylua,
    -- formatting.google_java_format,
    diagnostics.eslint_d,
    -- diagnostics.editorconfig_checker,
    -- diagnostics.flake8,
    -- diagnostics.codespell,
    -- diagnostics.cspell,
    -- diagnostics.commitlint,
    -- diagnostics.gitlint,
    diagnostics.luacheck,
    diagnostics.markdownlint,
    diagnostics.tsc,
  },
})
