local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  --require("nvim-navbuddy").attach(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
  lsp_zero.async_autoformat(client, bufnr)
end)

-- add 'vim' to lua globals
--require('lspconfig').lua_ls.setup {
--settings = {
--Lua = {
--diagnostics = {
--globals = { 'vim' }
--}
--}
--}
--}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require('lspconfig').emmet_ls.setup({
  --on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
  init_options = {
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        ["bem.enabled"] = true,
      },
    },
  }
})

--local nvim_lsp = require("lspconfig")

--local on_attach = function(client, bufnr)
---- other stuff --
--require("tailwindcss-colors").buf_attach(bufnr)
--end

--nvim_lsp["tailwindcss"].setup({
---- other settings --
--on_attach = on_attach,
--})


require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { "cssls", "emmet_ls", "jsonls", "lua_ls", "tsserver", "jedi_language_server" },
  handlers = {
    lsp_zero.default_setup,
  },
})
