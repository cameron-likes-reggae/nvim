local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- File icons for file explorer
	"nvim-tree/nvim-web-devicons",

	-- Beautiful status bar
	"nvim-lualine/lualine.nvim",

	"rcarriga/nvim-notify",

	"zaldih/themery.nvim",

	{ "folke/neodev.nvim", opts = {} },

	-- Colorschemes
	{
		"bluz71/vim-nightfly-colors",
		name = "nightfly",
		lazy = false,
		priority = 1000,
	},
	{ "catppuccin/nvim", as = "catppuccin" },
	{ "folke/tokyonight.nvim" },
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
	{ "rose-pine/neovim", as = "rose-pine" },
	{ "sekke276/dark_flat.nvim" },
	{ "rebelot/kanagawa.nvim" },

	-- File parsing
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- Fuzzy file finding
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	},

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- LSP Zero for Language servers
	"VonHeikemen/lsp-zero.nvim",
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	-- LSP Support
	{ "neovim/nvim-lspconfig" },
	{ "stevearc/conform.nvim", opts = {} },

	{
		"j-hui/fidget.nvim",
		opts = {
			-- options
		},
	},
	-- Typescript tools
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	},

	-- CMP
	{ "SirVer/ultisnips" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/cmp-calc" },
	{ "onsails/lspkind.nvim" },

	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					keymap = {
						accept = "<Tab>",
						dismiss = "<M-]>",
					},
				},
				panel = { enabled = false },
			})
		end,
	},

	{ "echasnovski/mini.nvim" },

	-- {
	-- 	"folke/noice.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		-- add any options here
	-- 		notify = {
	-- 			enabled = false,
	-- 		},
	-- 		cmdline = {
	-- 			enabled = true,
	-- 			view = "cmdline",
	-- 		},
	-- 		lsp = {
	-- 			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
	-- 			override = {
	-- 				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
	-- 				["vim.lsp.util.stylize_markdown"] = true,
	-- 				["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
	-- 			},
	-- 		},
	-- 		-- you can enable a preset for easier configuration
	-- 		-- presets = {
	-- 		-- 	bottom_search = true, -- use a classic bottom cmdline for search
	-- 		-- 	command_palette = true, -- position the cmdline and popupmenu together
	-- 		-- 	long_message_to_split = true, -- long messages will be sent to a split
	-- 		-- 	inc_rename = false, -- enables an input dialog for inc-rename.nvim
	-- 		-- 	lsp_doc_border = false, -- add a border to hover docs and signature help
	-- 		-- },
	-- 		hover = {
	-- 			enabled = true,
	-- 			silent = true, -- set to true to not show a message if hover is not available
	-- 			view = nil, -- when nil, use defaults from documentation
	-- 			opts = {}, -- merged with defaults from documentation
	-- 		},
	-- 		documentation = {
	-- 			view = "hover",
	-- 			opts = {
	-- 				lang = "markdown",
	-- 				replace = true,
	-- 				render = "plain",
	-- 				format = { "{message}" },
	-- 				win_options = { concealcursor = "n", conceallevel = 3, border = "none" },
	-- 			},
	-- 		},
	-- 	},
	-- 	dependencies = {
	-- 		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	-- 		"MunifTanjim/nui.nvim",
	-- 	},
	-- },

	-- Show hunks in files
	"lewis6991/gitsigns.nvim",

	-- Practicing Vim motions
	"ThePrimeagen/vim-be-good",

	-- -- Harpoon for quick file navigation
	-- "ThePrimeagen/harpoon",

	-- Grapple for tag navigation
	{
		"cbochs/grapple.nvim",
		opts = {
			scope = "git", -- also try out "git_branch"
		},
		event = { "BufReadPost", "BufNewFile" },
		cmd = "Grapple",
		keys = {
			{ "<leader>m", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
			{ "<leader>k", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple toggle tags" },
			{ "<leader>K", "<cmd>Grapple toggle_scopes<cr>", desc = "Grapple toggle scopes" },
			{ "<leader>j", "<cmd>Grapple cycle forward<cr>", desc = "Grapple cycle forward" },
			{ "<leader>J", "<cmd>Grapple cycle backward<cr>", desc = "Grapple cycle backward" },
			{ "<leader>1", "<cmd>Grapple select index=1<cr>", desc = "Grapple select 1" },
			{ "<leader>2", "<cmd>Grapple select index=2<cr>", desc = "Grapple select 2" },
			{ "<leader>3", "<cmd>Grapple select index=3<cr>", desc = "Grapple select 3" },
			{ "<leader>4", "<cmd>Grapple select index=4<cr>", desc = "Grapple select 4" },
		},
	},

	-- Dracula Colorscheme
	"Mofiqul/dracula.nvim",

	-- File Explorer Plugin
	"nvim-neo-tree/neo-tree.nvim",
	"nvim-lua/plenary.nvim",

	{
		"themaxmarchuk/tailwindcss-colors.nvim",
		-- load only on require("tailwindcss-colors")
		module = "tailwindcss-colors",
		-- run the setup function after plugin is loaded
		config = function()
			-- pass config options here (or nothing to use defaults)
			require("tailwindcss-colors").setup()
		end,
	},
	-- Vim git
	"tpope/vim-fugitive",

	-- Git tree
	"rbong/vim-flog",

	-- Better Diagnostics
	"dgagn/diagflow.nvim",

	-- Trouble
	"folke/trouble.nvim",

	-- Surround Words/Text with quotes, brackets etc.
	"tpope/vim-surround",

	"nvim-pack/nvim-spectre",

	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

	-- "HiPhish/rainbow-delimiters.nvim",

	-- CSS colour highlighter
	"ap/vim-css-color",

	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		-- optionally, override the default options:
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})
		end,
	},

	"echasnovski/mini.indentscope",

	"SmiteshP/nvim-navbuddy",

	"SmiteshP/nvim-navic",

	"MunifTanjim/nui.nvim",
	"numToStr/Comment.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",

	"stevearc/dressing.nvim",

	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
	"vim-scripts/dbext.vim",

	-- Minesweeper >:)
	"seandewar/nvimesweeper",
}, {})
