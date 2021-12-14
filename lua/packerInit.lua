local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "--depth=1", "https://github.com/wbthomason/packer.nvim", install_path })
  execute("packadd packer.nvim")
end

-- Packer commands
vim.cmd [[command! PackerInstall packadd packer.nvim | lua require("plugins").install()]]
vim.cmd [[command! PackerUpdate packadd packer.nvim | lua require("plugins").update()]]
vim.cmd [[command! PackerSync packadd packer.nvim | lua require("plugins").sync()]]
vim.cmd [[command! PackerClean packadd packer.nvim | lua require("plugins").clean()]]
vim.cmd [[command! PackerCompile packadd packer.nvim | lua require("plugins").compile()]]
vim.cmd [[command! PackerStatus packadd packer.nvim | lua require("plugins").status()]]
vim.cmd [[command! PC PackerCompile]]
vim.cmd [[command! PS PackerStatus]]
vim.cmd [[command! PU PackerSync]]

-- packer settings
return require('packer').init({
  -- tell packer to put packer_compiled under the /lua folder so its cached by impatient
  -- compile_path = vim.fn.stdpath('config' .. '/lua/packer_compiled.lua'),
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
    prompt_border = 'rounded',
  },
  git = {
    clone_timeout = 600, -- Timeout, in seconds, for git clones
  },
})
