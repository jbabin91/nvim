local interface = require "config.interface"
local tools = require "config.tools"
local M = {}

function M.setup()
  interface.setup()
  interface.alpha_setup()
  interface.barbar_setup()
  interface.lualine_setup()
  tools.setup()
end

return M
