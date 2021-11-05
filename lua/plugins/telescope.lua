local status_ok, telescope = pcall(require, "telescope")

if not status_ok then return end

telescope.setup({
  extensions = {
    media_files = {
      filetypes = { "png", "webp", "jpg", "jpeg" },
      find_cmd = "rg",
    },
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})

telescope.load_extension("media_files")
telescope.load_extension("fzf")
