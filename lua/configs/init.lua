local modules = {
  "theme",
  "lsp",
  "cmp",
  "lualine",
  "lspkind",
  "tabline",
  "file-explorer",
  "gitsigns",
  "ultisnips",
  "dashboard",
  "blankline",
  "autopairs",
  "telescope",
  "nvimcomment",
  "todo-comments",
  "toggleterm",
  "treesitter",
}

for _, mod in ipairs(modules) do
  local ok, err = pcall(require, string.format("configs.%s", mod))
  if not ok then
    -- stylua: ignore
    vim.notify(
      string.format("--- Module '%s' failed to load due to error: %s", mod, err),
      vim.log.levels.ERROR
    )
  end
end
