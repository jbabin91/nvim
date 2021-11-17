--━━━━━━━━━━━━━❰ Leader Mapping ❱━━━━━━━━━━━━━--
-- mapping leader here. it will work for every mapped
vim.g.mapleader = " "
vim.g.maplocalleader = " "
--━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━--

--━━━━━━━━━━━━━❰ Load/Source Configs ❱━━━━━━━━━━━━━--
-- plugin config to improve startup-time.
-- it should be always on top of init.lua

-- impatient needs to be setup before any other lua plugin is loaded so it is recommended you add the following near the start of your config
require("plugins/impatient_nvim")
-- Easily speed up your neovim startup time!
require("plugins/filetype_nvim")

require("plugin")

require("configs")
require("mappings")

-- Roshniline
-- require("customs/roshniline")
-- always put this config(override_default) at last because it's use to override any already defined configs.
-- require("customs/override_default")
