local lsp_modules = {
  -- "solidity",
  -- "bash",
  -- "css",
  -- "docker",
  -- "graphql",
  -- "html",
  -- "json",
  -- "ts",
  -- "teal",
  -- "yaml",
  -- "prisma",
  -- "tailwind",
  -- "diagnostics",
  "servers",
}

for _, module in ipairs(lsp_modules) do
  local ok, err = pcall(require, "lsp." .. module)
  if not ok then
    error(("Error loading... %s\n\n%s"):format(module, err))
  end
end
