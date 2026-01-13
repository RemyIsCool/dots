vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.wrap = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.opt.breakindent = true

vim.opt.undofile = true
vim.opt.swapfile = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

vim.opt.inccommand = "split"

vim.opt.scrolloff = 10

vim.opt.signcolumn = "yes"
vim.o.winborder = "rounded"

vim.cmd("set termguicolors")

if vim.g.neovide then
	vim.o.guifont = "JetBrains Mono:h16"
	vim.g.neovide_cursor_animation_length = 0
	vim.g.neovide_scroll_animation_length = 0
	vim.g.neovide_position_animation_length = 0
end
