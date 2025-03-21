return {
	"tpope/vim-sleuth",
	"tpope/vim-fugitive",
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", "<Cmd>UndotreeToggle<CR>")
		end,
	},
}
