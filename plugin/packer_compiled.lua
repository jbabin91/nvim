-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = true
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
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
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
  ["FixCursorHold.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/opt/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  ["coq.artifacts"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/coq.artifacts",
    url = "https://github.com/ms-jpq/coq.artifacts"
  },
  ["coq.thirdparty"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/coq.thirdparty",
    url = "https://github.com/ms-jpq/coq.thirdparty"
  },
  coq_nvim = {
    after = { "nvim-lsp-installer" },
    loaded = true,
    only_config = true
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["lsp-colors.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15lsp-colors\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/opt/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n¿\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\foptions\1\0\0\23section_separators\1\0\2\nright\5\tleft\5\25component_separators\1\0\2\nright\5\tleft\5\1\0\2\ntheme\tauto\17globalstatus\2\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mini.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/mini.nvim",
    url = "https://github.com/echasnovski/mini.nvim"
  },
  neogit = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/opt/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["nlsp-settings.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/nlsp-settings.nvim",
    url = "https://github.com/tamago324/nlsp-settings.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lsp-installer"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/opt/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nÒ\2\0\0\5\0\18\0\0286\0\0\0'\2\1\0'\3\2\0'\4\3\0B\0\4\0016\0\0\0'\2\1\0'\3\4\0'\4\5\0B\0\4\0016\0\0\0'\2\1\0'\3\6\0'\4\a\0B\0\4\0016\0\b\0'\2\t\0B\0\2\0029\0\n\0005\2\v\0005\3\f\0=\3\r\0025\3\15\0005\4\14\0=\4\16\3=\3\17\2B\0\2\1K\0\1\0\factions\14open_file\1\0\0\1\0\1\18resize_window\2\tview\1\0\1 preserve_window_proportions\2\1\0\2\15update_cwd\2\18disable_netrw\2\nsetup\14nvim-tree\frequire\31<cmd>NvimTreeFindFile <cr>\15<leader>tf\31<cmd>NvimTreeRefresh  <cr>\15<leader>tr\31<cmd>NvimTreeToggle   <cr>\15<leader>tt\6n\bmap\0" },
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["one-nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/one-nvim",
    url = "https://github.com/Th3Whit3Wolf/one-nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/opt/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/opt/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    config = { "\27LJ\2\n®\2\0\0\5\0\14\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\3=\3\v\0025\3\f\0=\3\r\2D\0\2\0\18layout_config\1\0\1\vheight\3\15\16borderchars\1\0\4\18results_title\1\17prompt_title\1\14previewer\1\nwidth\4ö≥ÊÃ\tô≥¶ˇ\3\fpreview\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚îå\b‚îê\b‚îò\b‚îî\fresults\1\2\0\0\6 \vprompt\1\0\0\1\t\0\0\b‚îÄ\6 \6 \6 \b‚îÄ\b‚îÄ\6 \6 \fget_ivy\21telescope.themes\frequire¶\5\1\0\b\0\26\0(6\0\0\0'\2\1\0'\3\2\0'\4\3\0B\0\4\0016\0\0\0'\2\1\0'\3\4\0'\4\5\0B\0\4\0016\0\0\0'\2\1\0'\3\6\0'\4\a\0B\0\4\0016\0\b\0'\2\t\0B\0\2\0026\1\b\0'\3\n\0B\1\2\0023\2\f\0=\2\v\0019\1\r\0005\3\22\0005\4\20\0005\5\18\0005\6\15\0005\a\14\0=\a\16\0065\a\17\0=\a\1\6=\6\19\5=\5\21\4=\4\23\3B\1\2\0019\1\24\0'\3\25\0B\1\2\1K\0\1\0\17file_browser\19load_extension\fpickers\1\0\0\fbuffers\1\0\0\rmappings\1\0\0\1\0\1\add\18delete_buffer\6i\1\0\0\1\0\1\n<c-d>\18delete_buffer\nsetup\0\18minimal_theme\21telescope.themes\14telescope\frequirew<cmd>lua require('telescope').extensions.file_browser.file_browser(require('telescope.themes').minimal_theme()<cr>\15<leader>ffb<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').minimal_theme()<cr>\15<leader>fbe<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').minimal_theme()<cr>\15<leader>fs\6n\bmap\0" },
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^neogit"] = "neogit",
  ["^nvim%-web%-devicons"] = "nvim-web-devicons",
  ["^plenary"] = "plenary.nvim",
  ["^popup"] = "popup.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: coq_nvim
time([[Config for coq_nvim]], true)
try_loadstring("\27LJ\2\n\\\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\2\27display.pum.fast_close\1\15auto_start\fshut-up\17coq_settings\6g\bvim\0", "config", "coq_nvim")
time([[Config for coq_nvim]], false)
-- Config for: telescope-file-browser.nvim
time([[Config for telescope-file-browser.nvim]], true)
try_loadstring("\27LJ\2\n®\2\0\0\5\0\14\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\3=\3\v\0025\3\f\0=\3\r\2D\0\2\0\18layout_config\1\0\1\vheight\3\15\16borderchars\1\0\4\18results_title\1\17prompt_title\1\14previewer\1\nwidth\4ö≥ÊÃ\tô≥¶ˇ\3\fpreview\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚îå\b‚îê\b‚îò\b‚îî\fresults\1\2\0\0\6 \vprompt\1\0\0\1\t\0\0\b‚îÄ\6 \6 \6 \b‚îÄ\b‚îÄ\6 \6 \fget_ivy\21telescope.themes\frequire¶\5\1\0\b\0\26\0(6\0\0\0'\2\1\0'\3\2\0'\4\3\0B\0\4\0016\0\0\0'\2\1\0'\3\4\0'\4\5\0B\0\4\0016\0\0\0'\2\1\0'\3\6\0'\4\a\0B\0\4\0016\0\b\0'\2\t\0B\0\2\0026\1\b\0'\3\n\0B\1\2\0023\2\f\0=\2\v\0019\1\r\0005\3\22\0005\4\20\0005\5\18\0005\6\15\0005\a\14\0=\a\16\0065\a\17\0=\a\1\6=\6\19\5=\5\21\4=\4\23\3B\1\2\0019\1\24\0'\3\25\0B\1\2\1K\0\1\0\17file_browser\19load_extension\fpickers\1\0\0\fbuffers\1\0\0\rmappings\1\0\0\1\0\1\add\18delete_buffer\6i\1\0\0\1\0\1\n<c-d>\18delete_buffer\nsetup\0\18minimal_theme\21telescope.themes\14telescope\frequirew<cmd>lua require('telescope').extensions.file_browser.file_browser(require('telescope.themes').minimal_theme()<cr>\15<leader>ffb<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').minimal_theme()<cr>\15<leader>fbe<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').minimal_theme()<cr>\15<leader>fs\6n\bmap\0", "config", "telescope-file-browser.nvim")
time([[Config for telescope-file-browser.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n¿\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\foptions\1\0\0\23section_separators\1\0\2\nright\5\tleft\5\25component_separators\1\0\2\nright\5\tleft\5\1\0\2\ntheme\tauto\17globalstatus\2\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nÒ\2\0\0\5\0\18\0\0286\0\0\0'\2\1\0'\3\2\0'\4\3\0B\0\4\0016\0\0\0'\2\1\0'\3\4\0'\4\5\0B\0\4\0016\0\0\0'\2\1\0'\3\6\0'\4\a\0B\0\4\0016\0\b\0'\2\t\0B\0\2\0029\0\n\0005\2\v\0005\3\f\0=\3\r\0025\3\15\0005\4\14\0=\4\16\3=\3\17\2B\0\2\1K\0\1\0\factions\14open_file\1\0\0\1\0\1\18resize_window\2\tview\1\0\1 preserve_window_proportions\2\1\0\2\15update_cwd\2\18disable_netrw\2\nsetup\14nvim-tree\frequire\31<cmd>NvimTreeFindFile <cr>\15<leader>tf\31<cmd>NvimTreeRefresh  <cr>\15<leader>tr\31<cmd>NvimTreeToggle   <cr>\15<leader>tt\6n\bmap\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-lsp-installer ]]
vim.cmd [[ packadd nvim-lspconfig ]]
vim.cmd [[ packadd lsp-colors.nvim ]]

-- Config for: lsp-colors.nvim
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15lsp-colors\frequire\0", "config", "lsp-colors.nvim")

vim.cmd [[ packadd nvim-treesitter ]]
vim.cmd [[ packadd nvim-ts-context-commentstring ]]
time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-colorizer.lua'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'FixCursorHold.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles(1) end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
