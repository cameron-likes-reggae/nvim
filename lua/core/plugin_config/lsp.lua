local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  require("nvim-navbuddy").attach(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
  lsp_zero.async_autoformat(client, bufnr)
end)

-- add 'vim' to lua globals
require('lspconfig').lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}

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
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
  },
})
