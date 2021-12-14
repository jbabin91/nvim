--  __  __         _             _       _ _
-- |  \/  |_   _  | |_   _  __ _(_)_ __ (_) |_
-- | |\/| | | | | | | | | |/ _` | | '_ \| | __|
-- | |  | | |_| | | | |_| | (_| | | | | | | |_
-- |_|  |_|\__, | |_|\__,_|\__,_|_|_| |_|_|\__|
--         |___/

local fn = vim.fn
local cmd = vim.cmd
local nvim_cmd = vim.api.nvim_command

-- Auto install packer.nvim if it doesn't exists --
---------------------------------------------------
local function packer_init()
  local install_path = fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    nvim_cmd("!git clone --depth=1 https://github.com/wbthomason/packer.nvim " .. install_path)
  end
  cmd [[packadd packer.nvim]]
  cmd [[autocmd BufWritePost plugins.lua PackerCompile]] -- Auto compile when there are changes in plugins.lua
end

-- Loading Modules --
---------------------------------------------------
packer_init()

local present, _ = pcall(require, "impatient")
if present then
  require "impatient"
end

-- Modules --
require "plugins"
require("settings").disable_builtins()
require("settings").setup()
require("config").setup()
require("ide").setup()
require("keymappings").setup()
require("autocmd").setup()
