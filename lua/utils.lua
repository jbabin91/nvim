local M = {}

function M.bootstrap()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path,
    })
    print 'Installing Packer...'
    vim.cmd [[packadd packer.nvim]]
  end
end

function M.packer_commands()
  local cmd = vim.cmd
  cmd [[command! PC PackerCompile]]
  cmd [[command! PU PackerSync]]
end

function M.commands()
  M.packer_commands()
end

function M.filetypes()
  local g = vim.g
  g.do_filetype_lua = 1
  g.did_load_filetypes = 0
end

function M.disabled_builtins()
  local g = vim.g
  g.loaded_2html_plugin = false
  g.loaded_getscript = false
  g.loaded_getscriptPlugin = false
  g.loaded_gzip = false
  g.loaded_logipat = false
  g.loaded_netrwFileHandlers = false
  g.loaded_netrwPlugin = false
  g.loaded_netrwSettngs = false
  g.loaded_remote_plugins = false
  g.loaded_tar = false
  g.loaded_tarPlugin = false
  g.loaded_zip = false
  g.loaded_zipPlugin = false
  g.loaded_vimball = false
  g.loaded_vimballPlugin = false
  g.zipPlugin = false
end

return M
