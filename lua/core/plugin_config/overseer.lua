require("overseer").setup({
	task_list = {
		default_detail = 2,
		direction = "right",
	},
	component_aliases = {
		default = {
			{ "on_output_summarize", max_lines = 10 },
		},
	},
})

vim.keymap.set("n", "<leader>oo", "<cmd>OverseerToggle!<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>oa", "<cmd>OverseerQuickAction<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>or", "<cmd>OverseerRun<cr>", { noremap = true, silent = true })
