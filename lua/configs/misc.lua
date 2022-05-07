local notify_status, notify = pcall(require, "notify")
if not notify_status then
  print("'nvim-notify' was not found.")
  return
end

vim.notify = notify
