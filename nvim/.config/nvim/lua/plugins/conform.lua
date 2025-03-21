return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
		},

		{
			"<D-s>",
			function()
				require("conform").format({ async = false, lsp_format = "fallback" })
				vim.cmd("w")
			end,
			mode = "",
		},
	},
	opts = {
		notify_on_error = false,
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black", "isort" },
		},
	},
}
