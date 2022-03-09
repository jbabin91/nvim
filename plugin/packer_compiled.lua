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
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n'\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\fComment\frequire\0" },
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["SchemaStore.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/SchemaStore.nvim",
    url = "https://github.com/b0o/SchemaStore.nvim"
  },
  ["committia.vim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/committia.vim",
    url = "https://github.com/rhysd/committia.vim"
  },
  ["copilot.vim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/opt/copilot.vim",
    url = "https://github.com/github/copilot.vim"
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
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24jb.configs.coq_nvim\frequire\0" },
    loaded = true,
    needs_bufread = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/opt/coq_nvim",
    url = "https://github.com/ms-jpq/coq_nvim"
  },
  ["dressing.nvim"] = {
    config = { "\27LJ\2\nÄ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\ninput\1\0\0\1\0\1\17winhighlight)NormalFloat:DressingInputNormalFloat\nsetup\rdressing\frequire\0" },
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["fidget.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["git-messenger.vim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/git-messenger.vim",
    url = "https://github.com/rhysd/git-messenger.vim"
  },
  ["gitlinker.nvim"] = {
    config = { "\27LJ\2\n¢\3\0\0\6\0\r\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\n\0'\3\a\0'\4\v\0005\5\f\0B\0\5\1K\0\1\0\1\0\1\vsilent\2{<cmd>lua require\"gitlinker\".get_buf_range_url(\"v\", {action_callback = require\"gitlinker.actions\".open_in_browser})<CR>\6v\1\0\1\vsilent\2{<cmd>lua require\"gitlinker\".get_buf_range_url(\"n\", {action_callback = require\"gitlinker.actions\".open_in_browser})<CR>\15<leader>go\6n\20nvim_set_keymap\bapi\bvim\nsetup\14gitlinker\frequire\0" },
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/gitlinker.nvim",
    url = "https://github.com/ruifm/gitlinker.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24jb.configs.gitsigns\frequire\0" },
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["goto-preview"] = {
    config = { "\27LJ\2\ná\2\0\2\v\0\n\0\0226\2\0\0009\2\1\2'\4\2\0\18\6\4\0009\4\3\4\18\a\1\0B\4\3\0A\2\0\0016\2\0\0009\2\4\0029\2\5\2\18\4\0\0'\5\6\0'\6\a\0'\a\b\0\18\t\a\0009\a\3\a\18\n\1\0B\a\3\0025\b\t\0B\2\6\1K\0\1\0\1\0\1\fnoremap\2.<cmd>call nvim_win_close(%d, v:false)<CR>\n<Esc>\6n\24nvim_buf_set_keymap\bapi\vformatG autocmd WinLeave <buffer> ++once call nvim_win_close(%d, v:false)\bcmd\bvimu\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0003\3\4\0=\3\5\2B\0\2\1K\0\1\0\19post_open_hook\0\1\0\2\fopacity\3\a\21default_mappings\2\nsetup\17goto-preview\frequire\0" },
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/goto-preview",
    url = "https://github.com/rmagatti/goto-preview"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nw\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\31show_current_context_start\2\25show_current_context\2\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["kanagawa.nvim"] = {
    config = { "\27LJ\2\n’\n\0\0\5\0A\0E6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2<\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\28\0=\4\29\0035\4\30\0=\4\31\0035\4 \0=\4!\0035\4\"\0=\4#\0035\4$\0=\4%\0035\4&\0=\4'\0035\4(\0=\4)\0035\4*\0=\4+\0035\4,\0=\4-\0035\4.\0=\4/\0035\0040\0=\0041\0035\0042\0=\0043\0035\0044\0=\0045\0035\0046\0=\0047\0035\0048\0=\0049\0035\4:\0=\4;\3=\3=\2B\0\2\0016\0>\0009\0?\0'\2@\0B\0\2\1K\0\1\0\25colorscheme kanagawa\bcmd\bvim\14overrides\1\0\0\vVisual\1\0\1\abg\f#4C566A\19TelescopeTitle\1\0\2\afg\f#C8C093\nstyle\tbold\26TelescopeResultsTitle\1\0\2\afg\f#1a1a22\abg\f#1a1a22\25TelescopePromptTitle\1\0\2\afg\f#1a1a22\abg\f#957FB8\26TelescopePromptPrefix\1\0\2\afg\f#957FB8\abg\f#2A2A37\26TelescopePromptNormal\1\0\2\afg\f#DCD7BA\abg\f#2A2A37\26TelescopePromptBorder\1\0\2\afg\f#2A2A37\abg\f#2A2A37\26TelescopePreviewTitle\1\0\2\afg\f#1a1a22\abg\f#7FB4CA\20TelescopeNormal\1\0\1\abg\f#1a1a22\22TelescopeMatching\1\0\3\afg\f#7FB4CA\nguisp\f#7FB4CA\nstyle\14underline\20TelescopeBorder\1\0\2\afg\f#1a1a22\abg\f#1a1a22\14TabNumSel\1\0\1\tlink\15TabLineSel\vTabNum\1\0\1\tlink\fTabLine\15TabLineSel\1\0\2\abg\f#1F1F28\nstyle\tbold\16TabLineFill\1\0\1\abg\f#1F1F28\fTabLine\1\0\2\abg\f#363646\nstyle\vitalic\vSearch\1\0\2\afg\f#232731\abg\f#B48EAD\21NvimTreeNormalNC\1\0\1\abg\f#14141A\19NvimTreeNormal\1\0\1\abg\f#14141A\21LualineGitDelete\1\0\1\tlink\19GitSignsDelete\21LualineGitChange\1\0\1\tlink\16GitSignsAdd\18LualineGitAdd\1\0\1\tlink\16GitSignsAdd IndentBlanklineContextStart\1\0\1\nstyle\tbold\24IndentBlanklineChar\1\0\1\afg\f#2F2F40\14IncSearch\1\0\2\afg\f#B48EAD\abg\f#5C6370\15FloatTitle\1\0\1\nstyle\tbold\22DressingInputText\1\0\1\abg\tnone\fComment\1\0\0\1\0\1\afg\f#888181\nsetup\rkanagawa\frequire\0" },
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\flspkind\frequire\0" },
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["lualine-lsp-progress"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/lualine-lsp-progress",
    url = "https://github.com/arkav/lualine-lsp-progress"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23jb.configs.lualine\frequire\0" },
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvcode-color-schemes.vim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/nvcode-color-schemes.vim",
    url = "https://github.com/christianchiarulli/nvcode-color-schemes.vim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30jb.configs.nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30jb.configs.nvim-colorizer\frequire\0" },
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-gps"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rnvim-gps\frequire\0" },
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/nvim-gps",
    url = "https://github.com/SmiteshP/nvim-gps"
  },
  ["nvim-lsp-installer"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19jb.configs.lsp\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/opt/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils",
    url = "https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25jb.configs.nvim-tree\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31jb.configs.nvim-treesitter\frequire\0" },
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  playground = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["startuptime.vim"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/opt/startuptime.vim",
    url = "https://github.com/tweekmonster/startuptime.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25jb.configs.telescope\frequire\0" },
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\nÇ\3\0\0\3\0\t\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\2\6\0B\0\2\0016\0\4\0009\0\5\0'\2\a\0B\0\2\0016\0\4\0009\0\5\0'\2\b\0B\0\2\1K\0\1\0\\autocmd TermEnter term://*toggleterm#* nnoremap <buffer> <C-t> <Esc><Cmd>ToggleTerm<CR>\\autocmd TermEnter term://*toggleterm#* tnoremap <buffer> <C-t> <Esc><Cmd>ToggleTerm<CR>%autocmd! ToggleTerminal WinEnter\bcmd\bvim\1\0\3\22terminal_mappings\1\20insert_mappings\1\17open_mapping\r<space>t\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["vim-choosewin"] = {
    config = { "\27LJ\2\nY\0\0\6\0\6\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0004\5\0\0B\0\5\1K\0\1\0\22<Plug>(choosewin)\6-\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/vim-choosewin",
    url = "https://github.com/t9md/vim-choosewin"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-dispatch-neovim"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/vim-dispatch-neovim",
    url = "https://github.com/radenling/vim-dispatch-neovim"
  },
  ["vim-doge"] = {
    commands = { "DogeGenerate" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/opt/vim-doge",
    url = "https://github.com/kkoomen/vim-doge"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-matchup"] = {
    config = { "\27LJ\2\nx\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\3\14highlight\24OffscreenMatchPopup\14fullwidth\3\1\vmethod\npopup!matchup_matchparen_offscreen\6g\bvim\0" },
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-maximizer"] = {
    config = { "\27LJ\2\nz\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\1\30<cmd>MaximizerToggle!<CR>\v<C-w>z\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/vim-maximizer",
    url = "https://github.com/szw/vim-maximizer"
  },
  ["vim-mundo"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/vim-mundo",
    url = "https://github.com/simnalamburt/vim-mundo"
  },
  ["vim-peekaboo"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/opt/vim-peekaboo",
    url = "https://github.com/junegunn/vim-peekaboo"
  },
  ["vim-polyglot"] = {
    loaded = true,
    needs_bufread = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/opt/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/vim-rooter",
    url = "https://github.com/airblade/vim-rooter"
  },
  ["vim-sleuth"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/opt/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-test"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24jb.configs.vim-test\frequire\0" },
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/janko/vim-test"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-wakatime"] = {
    loaded = true,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/start/vim-wakatime",
    url = "https://github.com/wakatime/vim-wakatime"
  },
  vimspector = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jacebabin/.local/share/nvim/site/pack/packer/opt/vimspector",
    url = "https://github.com/puremourning/vimspector"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: copilot.vim
time([[Setup for copilot.vim]], true)
try_loadstring("\27LJ\2\nV\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\2\20TelescopePrompt\1\18DressingInput\1\22copilot_filetypes\6g\bvim\0", "setup", "copilot.vim")
time([[Setup for copilot.vim]], false)
time([[packadd for copilot.vim]], true)
vim.cmd [[packadd copilot.vim]]
time([[packadd for copilot.vim]], false)
-- Setup for: vim-sleuth
time([[Setup for vim-sleuth]], true)
try_loadstring("\27LJ\2\n2\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\0\0=\1\2\0K\0\1\0\21sleuth_automatic\6g\bvim\0", "setup", "vim-sleuth")
time([[Setup for vim-sleuth]], false)
time([[packadd for vim-sleuth]], true)
vim.cmd [[packadd vim-sleuth]]
time([[packadd for vim-sleuth]], false)
-- Setup for: vim-doge
time([[Setup for vim-doge]], true)
try_loadstring("\27LJ\2\nd\0\0\2\0\5\0\t6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0K\0\1\0\1\2\0\0\6n\28doge_comment_jump_modes\25doge_enable_mappings\6g\bvim\0", "setup", "vim-doge")
time([[Setup for vim-doge]], false)
-- Setup for: vim-peekaboo
time([[Setup for vim-peekaboo]], true)
try_loadstring("\27LJ\2\n2\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\0\0=\1\2\0K\0\1\0\21peekaboo_compact\6g\bvim\0", "setup", "vim-peekaboo")
time([[Setup for vim-peekaboo]], false)
time([[packadd for vim-peekaboo]], true)
vim.cmd [[packadd vim-peekaboo]]
time([[packadd for vim-peekaboo]], false)
-- Setup for: indent-blankline.nvim
time([[Setup for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nú\2\0\0\3\0\v\0\0216\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0006\0\0\0009\0\1\0005\1\6\0=\1\5\0006\0\0\0009\0\1\0'\1\b\0=\1\a\0006\0\0\0009\0\t\0'\2\n\0B\0\2\1K\0\1\0\26set colorcolumn=99999\bcmd\b‚ñè\26indent_blankline_char\1\3\0\0\thelp\vpacker&indent_blankline_filetype_exclude\1\3\0\0\rterminal\vnofile%indent_blankline_buftype_exclude$indent_blankline_use_treesitter\6g\bvim\0", "setup", "indent-blankline.nvim")
time([[Setup for indent-blankline.nvim]], false)
time([[packadd for indent-blankline.nvim]], true)
vim.cmd [[packadd indent-blankline.nvim]]
time([[packadd for indent-blankline.nvim]], false)
-- Setup for: vim-polyglot
time([[Setup for vim-polyglot]], true)
try_loadstring("\27LJ\2\nh\0\0\2\0\5\0\t6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\2\0K\0\1\0\1\2\0\0\rmarkdown\1\3\0\0\15autoindent\rsensible\22polyglot_disabled\6g\bvim\0", "setup", "vim-polyglot")
time([[Setup for vim-polyglot]], false)
time([[packadd for vim-polyglot]], true)
vim.cmd [[packadd vim-polyglot]]
time([[packadd for vim-polyglot]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nÉ\1\0\0\2\0\5\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0K\0\1\0\27nvim_tree_add_trailing\21nvim_tree_git_hl\30nvim_tree_respect_buf_cwd\6g\bvim\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
time([[packadd for nvim-tree.lua]], true)
vim.cmd [[packadd nvim-tree.lua]]
time([[packadd for nvim-tree.lua]], false)
-- Setup for: coq_nvim
time([[Setup for coq_nvim]], true)
try_loadstring("\27LJ\2\n{\0\0\3\0\6\0\a6\0\0\0009\0\1\0005\1\4\0005\2\3\0=\2\5\1=\1\2\0K\0\1\0\vkeymap\1\0\2\27display.pum.fast_close\1\15auto_start\fshut-up\1\0\1\16recommended\1\17coq_settings\6g\bvim\0", "setup", "coq_nvim")
time([[Setup for coq_nvim]], false)
time([[packadd for coq_nvim]], true)
vim.cmd [[packadd coq_nvim]]
time([[packadd for coq_nvim]], false)
-- Setup for: vimspector
time([[Setup for vimspector]], true)
try_loadstring("\27LJ\2\nô\4\0\0\4\0\r\0\0316\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\t\0005\3\n\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\v\0005\3\f\0B\0\3\1K\0\1\0\1\0\3\vlinehl!VimspectorProgramCounterLine\ttext\v‚óè‚ñ∂\vtexthl'VimspectorProgramCounterBreakpoint\19vimspectorPCBP\1\0\3\vlinehl!VimspectorProgramCounterLine\ttext\b‚ñ∂\vtexthl\29VimspectorProgramCounter\17vimspectorPC\1\0\2\ttext\t ‚óè\vtexthl!VimspectorBreakpointDisabled\25vimspectorBPDisabled\1\0\2\ttext\t ‚óè\vtexthl\29VimspectorBreakpointCond\21vimspectorBPCond\1\0\2\ttext\t ‚óè\vtexthl\25VimspectorBreakpoint\17vimspectorBP\16sign_define\afn\bvim\0", "setup", "vimspector")
time([[Setup for vimspector]], false)
-- Config for: goto-preview
time([[Config for goto-preview]], true)
try_loadstring("\27LJ\2\ná\2\0\2\v\0\n\0\0226\2\0\0009\2\1\2'\4\2\0\18\6\4\0009\4\3\4\18\a\1\0B\4\3\0A\2\0\0016\2\0\0009\2\4\0029\2\5\2\18\4\0\0'\5\6\0'\6\a\0'\a\b\0\18\t\a\0009\a\3\a\18\n\1\0B\a\3\0025\b\t\0B\2\6\1K\0\1\0\1\0\1\fnoremap\2.<cmd>call nvim_win_close(%d, v:false)<CR>\n<Esc>\6n\24nvim_buf_set_keymap\bapi\vformatG autocmd WinLeave <buffer> ++once call nvim_win_close(%d, v:false)\bcmd\bvimu\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0003\3\4\0=\3\5\2B\0\2\1K\0\1\0\19post_open_hook\0\1\0\2\fopacity\3\a\21default_mappings\2\nsetup\17goto-preview\frequire\0", "config", "goto-preview")
time([[Config for goto-preview]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\flspkind\frequire\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31jb.configs.nvim-treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: vim-test
time([[Config for vim-test]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24jb.configs.vim-test\frequire\0", "config", "vim-test")
time([[Config for vim-test]], false)
-- Config for: gitlinker.nvim
time([[Config for gitlinker.nvim]], true)
try_loadstring("\27LJ\2\n¢\3\0\0\6\0\r\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\n\0'\3\a\0'\4\v\0005\5\f\0B\0\5\1K\0\1\0\1\0\1\vsilent\2{<cmd>lua require\"gitlinker\".get_buf_range_url(\"v\", {action_callback = require\"gitlinker.actions\".open_in_browser})<CR>\6v\1\0\1\vsilent\2{<cmd>lua require\"gitlinker\".get_buf_range_url(\"n\", {action_callback = require\"gitlinker.actions\".open_in_browser})<CR>\15<leader>go\6n\20nvim_set_keymap\bapi\bvim\nsetup\14gitlinker\frequire\0", "config", "gitlinker.nvim")
time([[Config for gitlinker.nvim]], false)
-- Config for: vim-matchup
time([[Config for vim-matchup]], true)
try_loadstring("\27LJ\2\nx\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\3\14highlight\24OffscreenMatchPopup\14fullwidth\3\1\vmethod\npopup!matchup_matchparen_offscreen\6g\bvim\0", "config", "vim-matchup")
time([[Config for vim-matchup]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25jb.configs.nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: coq_nvim
time([[Config for coq_nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24jb.configs.coq_nvim\frequire\0", "config", "coq_nvim")
time([[Config for coq_nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23jb.configs.lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-gps
time([[Config for nvim-gps]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rnvim-gps\frequire\0", "config", "nvim-gps")
time([[Config for nvim-gps]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30jb.configs.nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25jb.configs.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nw\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\31show_current_context_start\2\25show_current_context\2\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\nÇ\3\0\0\3\0\t\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\2\6\0B\0\2\0016\0\4\0009\0\5\0'\2\a\0B\0\2\0016\0\4\0009\0\5\0'\2\b\0B\0\2\1K\0\1\0\\autocmd TermEnter term://*toggleterm#* nnoremap <buffer> <C-t> <Esc><Cmd>ToggleTerm<CR>\\autocmd TermEnter term://*toggleterm#* tnoremap <buffer> <C-t> <Esc><Cmd>ToggleTerm<CR>%autocmd! ToggleTerminal WinEnter\bcmd\bvim\1\0\3\22terminal_mappings\1\20insert_mappings\1\17open_mapping\r<space>t\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: vim-maximizer
time([[Config for vim-maximizer]], true)
try_loadstring("\27LJ\2\nz\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\1\30<cmd>MaximizerToggle!<CR>\v<C-w>z\6n\20nvim_set_keymap\bapi\bvim\0", "config", "vim-maximizer")
time([[Config for vim-maximizer]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24jb.configs.gitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n'\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: vim-choosewin
time([[Config for vim-choosewin]], true)
try_loadstring("\27LJ\2\nY\0\0\6\0\6\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0004\5\0\0B\0\5\1K\0\1\0\22<Plug>(choosewin)\6-\6n\20nvim_set_keymap\bapi\bvim\0", "config", "vim-choosewin")
time([[Config for vim-choosewin]], false)
-- Config for: dressing.nvim
time([[Config for dressing.nvim]], true)
try_loadstring("\27LJ\2\nÄ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\ninput\1\0\0\1\0\1\17winhighlight)NormalFloat:DressingInputNormalFloat\nsetup\rdressing\frequire\0", "config", "dressing.nvim")
time([[Config for dressing.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30jb.configs.nvim-colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: kanagawa.nvim
time([[Config for kanagawa.nvim]], true)
try_loadstring("\27LJ\2\n’\n\0\0\5\0A\0E6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2<\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\28\0=\4\29\0035\4\30\0=\4\31\0035\4 \0=\4!\0035\4\"\0=\4#\0035\4$\0=\4%\0035\4&\0=\4'\0035\4(\0=\4)\0035\4*\0=\4+\0035\4,\0=\4-\0035\4.\0=\4/\0035\0040\0=\0041\0035\0042\0=\0043\0035\0044\0=\0045\0035\0046\0=\0047\0035\0048\0=\0049\0035\4:\0=\4;\3=\3=\2B\0\2\0016\0>\0009\0?\0'\2@\0B\0\2\1K\0\1\0\25colorscheme kanagawa\bcmd\bvim\14overrides\1\0\0\vVisual\1\0\1\abg\f#4C566A\19TelescopeTitle\1\0\2\afg\f#C8C093\nstyle\tbold\26TelescopeResultsTitle\1\0\2\afg\f#1a1a22\abg\f#1a1a22\25TelescopePromptTitle\1\0\2\afg\f#1a1a22\abg\f#957FB8\26TelescopePromptPrefix\1\0\2\afg\f#957FB8\abg\f#2A2A37\26TelescopePromptNormal\1\0\2\afg\f#DCD7BA\abg\f#2A2A37\26TelescopePromptBorder\1\0\2\afg\f#2A2A37\abg\f#2A2A37\26TelescopePreviewTitle\1\0\2\afg\f#1a1a22\abg\f#7FB4CA\20TelescopeNormal\1\0\1\abg\f#1a1a22\22TelescopeMatching\1\0\3\afg\f#7FB4CA\nguisp\f#7FB4CA\nstyle\14underline\20TelescopeBorder\1\0\2\afg\f#1a1a22\abg\f#1a1a22\14TabNumSel\1\0\1\tlink\15TabLineSel\vTabNum\1\0\1\tlink\fTabLine\15TabLineSel\1\0\2\abg\f#1F1F28\nstyle\tbold\16TabLineFill\1\0\1\abg\f#1F1F28\fTabLine\1\0\2\abg\f#363646\nstyle\vitalic\vSearch\1\0\2\afg\f#232731\abg\f#B48EAD\21NvimTreeNormalNC\1\0\1\abg\f#14141A\19NvimTreeNormal\1\0\1\abg\f#14141A\21LualineGitDelete\1\0\1\tlink\19GitSignsDelete\21LualineGitChange\1\0\1\tlink\16GitSignsAdd\18LualineGitAdd\1\0\1\tlink\16GitSignsAdd IndentBlanklineContextStart\1\0\1\nstyle\tbold\24IndentBlanklineChar\1\0\1\afg\f#2F2F40\14IncSearch\1\0\2\afg\f#B48EAD\abg\f#5C6370\15FloatTitle\1\0\1\nstyle\tbold\22DressingInputText\1\0\1\abg\tnone\fComment\1\0\0\1\0\1\afg\f#888181\nsetup\rkanagawa\frequire\0", "config", "kanagawa.nvim")
time([[Config for kanagawa.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-lsp-installer ]]

-- Config for: nvim-lsp-installer
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19jb.configs.lsp\frequire\0", "config", "nvim-lsp-installer")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DogeGenerate lua require("packer.load")({'vim-doge'}, { cmd = "DogeGenerate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'startuptime.vim'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'vimspector'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'vimspector', 'nvim-ts-autotag'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'vimspector', 'nvim-ts-autotag'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType svelte ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "svelte" }, _G.packer_plugins)]]
vim.cmd [[au FileType vue ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "vue" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'vimspector', 'nvim-ts-autotag'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
