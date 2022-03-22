local present, impatient = pcall(require, "imaptient")
if not present then
  return
end

impatient.enable_profile()
