return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
	},
	opts = {
		log_level = vim.log.levels.DEBUG,
		notify_on_error = false,
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black", "isort" },
		},
	},
}
