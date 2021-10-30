-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/jacebabin/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/jacebabin/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/jacebabin/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/jacebabin/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/jacebabin/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["better-escape.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/better-escape.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  ["comment.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/comment.nvim"
  },
  ["feline.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/feline.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["minsnip.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/minsnip.nvim"
  },
  ["neoscroll.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/nui.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-code-action-menu"] = {
    commands = { "CodeActionMenu" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/opt/nvim-code-action-menu"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/nvim-notify"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["package-info.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/package-info.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-one"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/vim-one"
  },
  ["vim-prisma"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/vim-prisma"
  },
  ["vim-solidity"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/vim-solidity"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/vim-startuptime"
  }
}

time([[Defining packer_plugins]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodeActionMenu lua require("packer.load")({'nvim-code-action-menu'}, { cmd = "CodeActionMenu", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
