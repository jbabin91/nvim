local fn = vim.fn
local execute = vim.api.nvim_command

local download_packer = function()
  local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    print("Downloading packer.nvim...")
    execute("!git clone --depth 1 https://github.com/wbthomason/packer.nvim " .. install_path)
    -- execute("packadd packer.nvim")
  end
-- vim.cmd "packadd packer.nvim" 
end

return function()
  if not pcall(require, "packer") then
    download_packer()
    return true
  end
  return false
end
