vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<C-c>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")

vim.keymap.set("n", "<C-q>", "ZZ")
vim.keymap.set("n", "<C-s>", "<Cmd>w<CR>")

vim.keymap.set({"n", "v"}, "<leader>f", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>o", "o<Esc>")
vim.keymap.set("n", "<leader>O", "O<Esc>")

vim.keymap.set("n", "<C-S-x>", "<Cmd>bdelete<CR>")
vim.keymap.set("n", "<C-n>", "<Cmd>bnext<CR>")
vim.keymap.set("n", "<C-p>", "<Cmd>bprevious<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set("n", "<leader>ve", function()
	vim.diagnostic.open_float()
end)

vim.keymap.set("v", "<leader>r", function()
	vim.cmd('normal! "vy')
	local text = vim.fn.getreg("v")
	text = text:gsub("\\", "\\\\")
	text = text:gsub("/", "\\/")

	vim.api.nvim_feedkeys(":%s/\\V" .. text .. "//gc", "n", false)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(string.rep("<Left>", 3), true, false, true), "n", false)
end)
