local M = {}

--          Mapping
-- ──────────────────────────────

function M.map(mode, keys, cmd, opt)
  local options = { noremap = true, silent = true }
  if opt then
    options = vim.tbl_extend("force", options.opt)
  end

  -- all valid modes allowed for mappings
  -- :h map-modes
  local valid_modes = {
    [""]  = true,
    ["n"] = true,
    ["v"] = true,
    ["s"] = true,
    ["x"] = true,
    ["o"] = true,
    ["!"] = true,
    ["i"] = true,
    ["l"] = true,
    ["c"] = true,
    ["t"] = true,
  }

  -- helper function for M.map
  -- can give multiple modes and keys
  local function map_wrapper(_mode, lhs, rhs, _options)
    if type(lhs) == "table" then
      for _, key in ipairs(lhs) do
        map_wrapper(_mode, key, rhs, _options)
      end
    else
      if type(_mode) == "table" then
        for _, m in ipairs(_mode) do
          map_wrapper(m, lhs, rhs, _options)
        end
      else
        if valid_modes[_mode] and lhs and rhs then
          vim.api.nvim_set_keymap(_mode, lhs, rhs, _options)
        else
          _mode, lhs, rhs = _mode or "", lhs or "", rhs or ""
          print(
            "Cannot set mapping [ mode = '"
            .. _mode
            .. "' | key = '"
            .. lhs
            .. "' | cmd = '"
            .. rhs
            .. "' ]"
          )
        end
      end
    end
  end
  map_wrapper(mode, keys, cmd, options)
end

--          autogroups
-- ──────────────────────────────

function M.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command("augroup " .. group_name)
    vim.api.nvim_command("autocmd!")
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{"autocmd", def}, " ")
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command("augroup END")
  end
end

return M
