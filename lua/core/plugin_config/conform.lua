local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- Use a sub-list to run only the first available formatter
		javascript = { "prettierd", "prettier" },
		javascriptreact = { "prettierd", "prettier" },
		typescript = { "prettierd", "prettier" },
		typescriptreact = { "prettierd", "prettierd" },
		json = { "prettierd", "prettier" },
	},

	format_on_save = {
		timeout = 500,
		lsp_fallback = true,
		async = false,
	},
})

vim.keymap.set("n", "<leader>cf", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout = 500,
	})
end, { noremap = true, silent = true })
