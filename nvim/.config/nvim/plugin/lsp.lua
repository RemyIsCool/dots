local lsp_zero = require("lsp-zero")

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		svelte = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		astro = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		angular = { "prettier" },
		vue = { "prettier" },
		flow = { "prettier" },
		less = { "prettier" },
		scss = { "prettier" },
		ember = { "prettier" },
		graphql = { "prettier" },
		markdown = { "prettier" },
	},
	format_on_save = {
		timeout_ms = 1000,
		lsp_format = "fallback",
	},
})

require("conform").formatters.prettier = {
	ft_parsers = {
		svelte = "svelte",
	},
}

lsp_zero.on_attach(function(_, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {},
	handlers = {
		function(server_name)
			if server_name == "tsserver" then
				server_name = "ts_ls"
			end
			require("lspconfig")[server_name].setup({})
		end,
	},
})

require("lspconfig").gdscript.setup({})

local cmp = require("cmp")

cmp.setup({
	preselect = "item",
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
})
