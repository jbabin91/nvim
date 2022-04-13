local present, schemastore = pcall(require, 'schemastore')
if not present then
  return {
    setup = {
      commands = {
        Format = {
          function()
            vim.lsp.buf.range_formatting(
              {},
              { 0, 0 },
              { vim.fn.line('$'), 0 }
            )
          end,
        },
      },
    },
  }
end

return {
  settings = {
    json = {
      schemas = schemastore.json.schemas(),
    },
  },
  setup = {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting(
            {},
            { 0, 0 },
            { vim.fn.line('$'), 0 }
          )
        end,
      },
    },
  }
}
