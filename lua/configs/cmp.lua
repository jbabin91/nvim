-- Setup nvim-cmp
local cmp = require("cmp")
local mapping = require("keymaps")

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menu,menuone,preview,noinsert"
vim.g.completion_matching_strategy_list = { "exact", "substring", "fuzzy" }

-- luasnip setup
-- local luasnip = require("luasnip")
-- require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  mapping = mapping.cmp_mappings,
  sources = {
    -- { name = "luasnip" },
    { name = "nvim_lsp", priority = 1 },
    { name = "ultisnips" },
    { name = "path" },
    -- { name = "emoji" },
    -- { name = "treesitter" },
    { name = "buffer" },
    -- { name = "calc" },
  },
})

-- signature_lsp
require("lsp_signature").setup({
  bind = true,
  extra_trigger_chars = { "(", "[", "{", " ", "," },
  hint_enable = false,
  handler_opts = {
    border = "none",
  },
})
