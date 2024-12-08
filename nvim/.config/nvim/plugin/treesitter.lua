require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"rust",
		"bash",
		"javascript",
		"typescript",
		"gdscript",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"markdown",
		"markdown_inline",
	},
	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true,

		additional_vim_regex_highlighting = false,
	},
})

-- Treesitter for .svx and .mdx files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.svx",
	command = "setfiletype svx",
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.mdx",
	command = "setfiletype mdx",
})
vim.treesitter.language.register("markdown", { "svx", "mdx" })
