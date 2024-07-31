require("themery").setup({
	themes = { "gruvbox", "catppuccin", "nightfly", "tokyonight", "rose-pine", "dracula", "dark_flat", "kanagawa" }, -- Your list of installed colorschemes
	livePreview = true, -- Apply theme while browsing. Default to true.
})

vim.keymap.set("n", "<F6>", "<cmd>Themery<CR>")
