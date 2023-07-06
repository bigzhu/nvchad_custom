-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local opt = vim.opt
-- Prevent cursor from going to the next line when moving with h,l
opt.whichwrap = "b,s"

-- set my cheese
local home = os.getenv "HOME"
vim.cmd("source " .. home .. "/.config/lvim/markdown.vim")
