local lsp_zero = require('lsp-zero')

-- Format on save
  local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local lsp_format_on_save = function(client, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = augroup,
    buffer = bufnr,
    callback = function(args)
      -- vim.lsp.buf.format()
      require("conform").format({ bufnr = args.buf })
    end,
  })
end



lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr }

  -- lsp_zero.async_autoformat(client, bufnr)
  -- lsp_format_on_save(client, bufnr)

  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  -- vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  vim.keymap.set('n', 'gd', "<cmd>lua require'telescope.builtin'.lsp_definitions{}<cr>", opts)
  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  -- vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  vim.keymap.set('n', 'gi', "<cmd>lua require'telescope.builtin'.lsp_implementations{}<cr>", opts)
  -- vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  vim.keymap.set('n', 'go', "<cmd>lua require'telescope.builtin'.lsp_type_definitions{}<cr>", opts)
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
  vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

  vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
  vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
  vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
end)

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { "cssls", "jsonls", "lua_ls", "tsserver" },
  handlers = {
    -- function(ls)
    --   require("lspconfig")[ls].setup {
    --     capabilities = capabilities
    --   }
    -- end,
    lsp_zero.default_setup,
    tsserver = function()
      require("lspconfig").tsserver.setup {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          lsp_zero.on_attach(client, bufnr)
        end,
      }
    end,
  },
})


require("lspconfig").tsserver.setup({
  capabilities = capabilities,
  handlers = {
    function()
      require("lspconfig").tsserver.setup {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          lsp_zero.on_attach(client, bufnr)
        end,
      }
    end,
  },
})

lsp_zero.setup()


-- require("typescript-tools").setup {
--   settings = {
--     -- spawn additional tsserver instance to calculate diagnostics on it
--     separate_diagnostic_server = true,
--     -- "change"|"insert_leave" determine when the client asks the server about diagnostic
--     publish_diagnostic_on = "change",
--     -- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
--     -- "remove_unused_imports"|"organize_imports") -- or string "all"
--     -- to include all supported code actions
--     -- specify commands exposed as code_actions
--     expose_as_code_action = "all",
--     -- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
--     -- not exists then standard path resolution strategy is applied
--     tsserver_path = nil,
--     -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
--     -- (see 💅 `styled-components` support section)
--     tsserver_plugins = {},
--     -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
--     -- memory limit in megabytes or "auto"(basically no limit)
--     tsserver_max_memory = "auto",
--     -- described below
--     tsserver_format_options = {},
--     tsserver_file_preferences = {},
--     -- locale of all tsserver messages, supported locales you can find here:
--     -- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
--     tsserver_locale = "en",
--     -- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
--     complete_function_calls = false,
--     include_completions_with_insert_text = true,
--     -- CodeLens
--     -- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
--     -- possible values: ("off"|"all"|"implementations_only"|"references_only")
--     code_lens = "off",
--     -- by default code lenses are displayed on all referencable values and for some of you it can
--     -- be too much this option reduce count of them by removing member references from lenses
--     disable_member_code_lens = true,
--     -- JSXCloseTag
--     -- WARNING: it is disabled by default (maybe you configuration or distro already uses nvim-ts-autotag,
--     -- that maybe have a conflict if enable this feature. )
--     jsx_close_tag = {
--       enable = false,
--       filetypes = { "javascriptreact", "typescriptreact" },
--     }
--   }
-- }
