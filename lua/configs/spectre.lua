local spectre_status, spectre = pcall(require, "spectre")
if not spectre_status then
  print("'Spectre' not found")
  return
end

spectre.setup()
