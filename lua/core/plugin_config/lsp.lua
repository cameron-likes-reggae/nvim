local lsp_zero = require("lsp-zero")

-- Format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local lsp_format_on_save = function(client, bufnr)
	vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = augroup,
		buffer = bufnr,
		callback = function(args)
			-- vim.lsp.buf.format()
			require("conform").format({ bufnr = args.buf })
		end,
	})
end

-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover,
--   {
--     border = "rounded",
--     padding = 0,
--     winhighlight = 'NormalFloat:NormalFloat,FloatBorder:NormalFloat',
--   }
-- )

lsp_zero.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr }

	-- lsp_zero.async_autoformat(client, bufnr)
	lsp_format_on_save(client, bufnr)

	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	-- vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
	vim.keymap.set("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions{}<cr>", opts)
	vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
	-- vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
	vim.keymap.set("n", "gi", "<cmd>lua require'telescope.builtin'.lsp_implementations{}<cr>", opts)
	-- vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
	vim.keymap.set("n", "go", "<cmd>lua require'telescope.builtin'.lsp_type_definitions{}<cr>", opts)
	vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
	vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
	vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
	vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

	vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
	vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
	vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
end)

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "cssls", "jsonls", "lua_ls", "tsserver" },
	handlers = {
		function(server)
			require("lspconfig")[server].setup({
				handlers = {
					["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }),
					["textDocument/signatureHelp"] = vim.lsp.with(
						vim.lsp.handlers.signature_help,
						{ border = "single" }
					),
				},
				on_attach = function(client, bufnr)
					lsp_zero.on_attach(client, bufnr)
				end,
				capabilities = capabilities,
			})
		end,
	},
})

-- require("lspconfig").tsserver.setup({
--   capabilities = capabilities,
--   handlers = {
--     function()
--       require("lspconfig").tsserver.setup {
--         capabilities = capabilities,
--         on_attach = function(client, bufnr)
--           lsp_zero.on_attach(client, bufnr)
--         end,
--       }
--     end,
--   },
-- })

lsp_zero.setup()
