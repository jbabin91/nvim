if require "plugins.first_load"() then return end
require("plugins.install")
require("plugins.configs")
-- require("plugins.configs.lsp")