local present, trailspace = pcall(require, "mini.trail_space")
if not present then
  return
end

trailspace.setup()
