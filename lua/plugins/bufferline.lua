local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then return end

bufferline.setup({
  options = {
    numbers = function(opts)
      return string.format("%s", opts.id)
    end,
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
      {
        filetype = "vista",
        text = "LspTags",
      }
    }
  }
})
