return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.ai").setup({ n_lines = 500 })

		require("mini.files").setup()

		vim.keymap.set("n", "-", MiniFiles.open)
	end,
}
