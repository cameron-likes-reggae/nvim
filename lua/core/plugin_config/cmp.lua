local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

-- Vscode snippets
--require('luasnip.loaders.from_vscode').lazy_load()

require('luasnip.loaders.from_snipmate').lazy_load()

cmp.setup({
  -- snippet = {
  --   expand = function(args)
  --     require('luasnip').lsp_expand(args.body)
  --   end,
  -- },
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  sources = {
    { name = 'nvim_lsp', max_item_count = 30 },
    { name = 'luasnip',  max_item_count = 30 },
  },
  formatting = {
    format = require("tailwindcss-colorizer-cmp").formatter,
  },
  mapping = cmp.mapping.preset.insert({
    -- `Tab` key to confirm completion
    ['<Tab>'] = cmp.mapping.confirm({ select = false }),

    -- Ctrl+Space to trigger completion menu
    ['<C-l>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
  experimental = {
    native_menu = false,
    ghost_text = true
  }
})
