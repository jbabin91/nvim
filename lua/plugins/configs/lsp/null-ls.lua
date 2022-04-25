local present, nls = pcall(require, 'null-ls')
if not present then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = nls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = nls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
local code_actions = nls.builtins.code_actions
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/hover
local hover = nls.builtins.hover

local function with_diagnostics_code(builtin)
  return builtin.with {
    diagnostics_format = '#{m} [#{c}]',
  }
end

local function with_root_file(builtin, file)
  return builtin.with {
    confition = function(utils)
      return utils.root_has_file(file)
    end,
  }
end

-- https://github.com/prettier-solidity/prettier-plugin-solidity
-- npm install --save-dev prettier Prettier-plugin-solidity
local sources = {
  -- formatting
  formatting.black.with { extra_args = { '--fast' } },
  formatting.eslint_d,
  -- formatting.fixjson,
  -- formatting.isort,
  formatting.prettierd,
  formatting.prismaFmt,
  formatting.stylua,

  -- diagnostics
  diagnostics.write_good,
  -- diagnostics.markdownline,
  diagnostics.eslint_d,
  -- diagnostics.flake8,
  diagnostics.tsc,
  -- diagnostics.selene,
  with_diagnostics_code(diagnostics.shellcheck),

  -- code actions
  code_actions.eslint_d,
  code_actions.gitrebase,
  code_actions.gitsigns,
  code_actions.refactoring,

  -- hover
  hover.dictionary,
}

nls.setup {
  -- debug = true,
  debounce = 150,
  Save_after_format = false,
  sources = sources,
  -- on_attach = opts.on_attach,
  -- root_dir = nls_utils.root_pattern '.git',
}
