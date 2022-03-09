if not pcall(require, "coq_nvim") then return end

local sources = {
  { src = "bc", short_name = "MATH", precision = 6 },
  { src = "repl", unsafe = { "rm", "sudo", "mv", "cp" }},
}

if vim.fn.executable "figlet" == 1 then
  table.insert(sources, { src = "figlet" })
end

if vim.fn.executable "cowsay" == 1 then
  table.insert(sources, { src = "cow" })
end

require "coq_3p"(sources)
require "jb.coq_3p.uuid"
