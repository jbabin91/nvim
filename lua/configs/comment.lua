local comment_status, comment = pcall(require, "Comment")
if not comment_status then
  print("'Comment' errors.")
  return
end

comment.setup()
