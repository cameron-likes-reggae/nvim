vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	desc = "Syntax highlighting when leaving insert mode",
	group = vim.api.nvim_create_augroup("enable_buf_hl", { clear = true }),
	callback = function()
		print("test")
		vim.cmd([[TSBufEnable highlight]])
	end,
})
