local installer_status, installer = pcall(require, "nvim-lsp-installer")
if not installer_status then
  error("Could not load nvim-lsp-installer.\n" .. installer)
  return
end

installer.setup({
  automatic_installation = true,
})
