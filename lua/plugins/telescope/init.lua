local present, telescope = pcall(require, 'telescope')
if not present then
  return
end

telescope.setup {
  defaults = {
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    generic_sorter = require('telescope.sorters').get_fzy_sorter,
    file_sorter = require('telescope.sorters').get_fzf_sorter,
  },
}
