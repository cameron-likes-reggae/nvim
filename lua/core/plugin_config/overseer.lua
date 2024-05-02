require("overseer").setup()

vim.keymap.set("n", "<leader>oo", "<cmd>OverseerToggle!<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>oa", "<cmd>OverseerQuickAction<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>or", "<cmd>OverseerRun<cr>", { noremap = true, silent = true })
