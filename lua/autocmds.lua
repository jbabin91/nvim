local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd({ "FileType", "BufWritePost" }, {
  callback = function()
    vim.cmd("set fo-=cro")
    local fts = { "html", "javascript", "json", "lua", "markdown", "ps1" }
    local size = 4
    for _, value in ipairs(fts) do
      if value == vim.bo.ft then
        size = 2
      end
    end
    vim.opt_local.shiftwidth = size
    vim.opt_local.tabstop = size
    vim.opt_local.softtabstop = size
    vim.opt.scl = "yes"
  end,
  group = augroup("setting_options", {}),
})
