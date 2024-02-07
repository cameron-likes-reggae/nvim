local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

-- Vscode snippets
-- require('luasnip.loaders.from_vscode').lazy_load()

-- require('luasnip.loaders.from_snipmate').lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  },
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  sources = {
    { name = 'nvim_lsp', keyword_length = 4, max_item_count = 10, priority = 10, group_index = 1 },
    { name = 'luasnip',  keyword_length = 4, max_item_count = 10, priority = 10, group_index = 1 },
  },
  performance = {
    trigger_debouce_time = 500,
    throttle = 550,
    fetching_timeout = 80,
  },
  formatting = {
    format = require("tailwindcss-colorizer-cmp").formatter,
  },
  mapping = cmp.mapping.preset.insert({
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
    -- ghost_text = true
  }
})
