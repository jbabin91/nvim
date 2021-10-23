local M = {}

M.setup = function()
  local remap = vim.api.nvim_set_keymap
  local npairs = require "nvim-autopairs"

  npairs.setup({ map_bs = false })

  vim.g.coq_settings = { keymap = { recommended = false }}

  -- These mappings are coq recommended mappings unrelated to nvim-autopairs
  remap("i", "<Esc>", [[ pumvisible() ? "<c-e><Esc>" : "<Esc>" ]],
        { expr = true, noremap = true })
  remap("i", "<c-c>", [[ pumvisible() ? "<c-e><c-c>" : "<c-c>" ]],
        { expr = true, noremap = true })
  remap("i", "<tab>", [[ pumvisible() ? "<c-n>" : "<tab>" ]],
        { expr = true, noremap = true })
  remap("i", "<s-tab>", [[ pumvisible() ? "<c-p>" : "<bs>" ]],
        { expr = true, noremap = true })

  _G.MUtils = {}

  MUtils.CR = function()
    if vim.fn.pumvisible() ~= 0 then
      if vim.fn.complete_info({"selected"}).selected ~= -1 then
        return npairs.esc("<c-y>")
      else
        -- you can change <c-g><c-g> to <c-e> if you don't use other i_CTRL-X modes
        return npairs.esc("<c-g><c-g>") .. npairs.autopairs_cr()
      end
    else
      return npairs.autopairs_cr()
    end
  end
  remap("i", "<CR>", "v:lua.MUtils.CR()", { expr = true, noremap = true })

  MUtils.BS = function()
    if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({"mode"}).mode == "eval" then
      return npairs.esc("<c-e>") .. npairs.autopairs_bs()
    else
      return npairs.autopairs_bs()
    end
  end
  remap("i", "<BS>", "v:lua.MUtils.BS()", { expr = true, noremap = true })
end

return M
