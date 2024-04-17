local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

local lspkind = require('lspkind')

cmp.setup({
  snippet = {
    expand = function(args)
      -- require('ultisnips').lsp_expand(args.body)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  view = {
    entries = {
      name            = 'custom',
      selection_order = 'near_cursor'
    }
  },
  window = {
    completion = {
      border       = 'none',
      winhighlight = 'NormalFloat:NormalFloat,FloatBorder:NormalFloat',
      -- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      max_height   = 30,
      col_offset   = -3,
      side_padding = 0,
      max_width    = 80,
      zindex       = 50,
    },
    documentation = {
      border = 'none',
      winhighlight = 'NormalFloat:NormalFloat,FloatBorder:NormalFloat',
      max_height = 15,
      max_width = 80,
      zindex = 50,
    },
  },
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  sources = {
    { name = 'nvim_lsp',  keyword_length = 2, max_item_count = 10, priority = 10, group_index = 1 },
    { name = 'ultisnips', keyword_length = 2, max_item_count = 10, priority = 10, group_index = 1 },
  },
  performance = {
    trigger_debouce_time = 500,
    throttle = 550,
    fetching_timeout = 80,
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = lspkind.cmp_format({
        mode = 'symbol_text',
        with_text = true,
        maxwidth = 50,
        menu = ({
          nvim_lsp = "[LSP]",
          ultisnips = "[UltiSnips]",
        }),
      })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. (strings[1] or "") .. " "
      kind.menu = "    (" .. (strings[2] or "") .. ")"

      return kind
    end
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
    -- native_menu = true,
    -- ghost_text = true
  }
})
