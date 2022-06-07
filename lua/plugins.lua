local cmd, fn, g = vim.cmd, vim.fn, vim.g
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

g.mapleader = ' '

-- Automatically install packer
local packer_bootstrap = false
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print 'Installing packer...'
  cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins
autocmd('BufWritePost', {
  command = 'source <afile> | PackerSync',
  group = augroup('packer_user_config', { clear = true }),
  pattern = 'plugins.lua',
})

-- Use a protected call so we don't error out on first call
local present, packer = pcall(require, 'packer')
if not present then
  return
end

-- Have packer use popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

-- Install your plugins
return packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
  use 'dstein64/vim-startuptime'
  -- https://github.com/tpope/vim-sensible
  use 'tpope/vim-sensible'
  -- https://github.com/github/copilot.vim
  use 'github/copilot.vim'
  -- code formatting
  use 'google/vim-maktaba'
  use 'google/vim-codefmt'
  use 'sbdchd/neoformat'
  -- remove reflections
  use { 'dracula/vim', as = 'dracula' }
  -- one dark theme
  use 'navarasu/onedark.nvim'
  -- https://github.com/kamykn/spelunker.vim
  -- spell checking, use Zl for list of replacements, Zg to add, Zt to toggle
  use 'kamykn/spelunker.vim'
  use 'kamykn/popup-menu.nvim'
  -- kitty syntax highlighting, way overkill
  use 'fladson/vim-kitty'
  -- auto-close parens, quotes, and brackets; auto-formats with new lines
  -- this was annoying me so I disabled it
  -- use "cohama/lexima.vim"

  -- show git status on lines
  use 'mhinz/vim-signify'
  -- wide ranging language support
  use 'sheerun/vim-polyglot'
  -- Git support
  use 'tpope/vim-fugitive'
  -- Github support, :GBrowse and <C-X><C-O> for omnicomplete
  use 'tpope/vim-rhubarb'
  -- navigate tmux panes with <C-movement> keys
  use 'christoomey/vim-tmux-navigator'
  -- toggle and switch stuff with [ and ]
  use 'tpope/vim-unimpaired'
  -- needed for telescope
  use 'nvim-lua/plenary.nvim'
  use 'BurntSushi/ripgrep'
  use 'nvim-telescope/telescope-fzf-native.nvim'
  use 'sharkdp/fd'
  use 'kyazdani42/nvim-web-devicons'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-telescope/telescope.nvim'
  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  -- auto-complete
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  -- statusline
  use 'nvim-lualine/lualine.nvim'

  if packer_bootstrap then
    packer.sync()
  end
end)
