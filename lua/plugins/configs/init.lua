local configs_modules = {
  "notifications",
  -- "auto-save",
  "completion-icons",
  "commenting",
  -- "file-tree",
  "finder",
  -- "word-highlight",
  "formatter-linter",
  "git-status",
  "icons",
  "indent-line",
  -- "markdown-preview",
  -- "mode-switch-fix",
  "plugin-manager",
  -- "project-manager",
  -- "package-info",
  "scroll",
  "snippets",
  -- "start-screen",
  -- "terminal",
  -- "todo-comments",
  -- "undo-tree",
  "tree-sitter",
  "status-line",
  "auto-pairs",
  "completion",
}

for _, module in ipairs(configs_modules) do
  local ok, err = pcall(require, "plugins.configs." .. module)
  if not ok then
    error(("Error loading... %s\n\n%s"):format(module, err))
  end
end
