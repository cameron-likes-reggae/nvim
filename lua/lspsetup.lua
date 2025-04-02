require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'gopls', 'tailwindcss', 'html', 'cssls', 'jsonls', },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

if not vim.g.vscode then
  -- Add cmp_nvim_lsp capabilities settings to lspconfig
  -- This should be executed before you configure any language server
  local lspconfig_defaults = require('lspconfig').util.default_config
  lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
  )
end

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    vim.keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    -- vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    vim.keymap.set('n', 'ga', '<cmd>lua require("tiny-code-action").code_action()<cr>', opts)
  end,
})

local has_words_before = function()
  local cursor = vim.api.nvim_win_get_cursor(0)
  return (vim.api.nvim_buf_get_lines(0, cursor[1] - 1, cursor[1], true)[1] or ''):sub(cursor[2], cursor[2]):match('%s')
end


local cmp_setup = function()
  if vim.g.vscode then
    return
  end

  local cmp = require('cmp')
  cmp.setup({
    window = {
      completion = cmp.config.window.bordered({
        winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      }),
      documentation = cmp.config.window.bordered({
        winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      }),
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },

      format = function(entry, vim_item)
        local kind = require("lspkind").cmp_format({
          mode = "symbol",
          preset = "codicons",
          symbol_map = {
            Copilot = "",
          },
        })(entry, vim.deepcopy(vim_item))
        -- remove new line characters from the entry
        entry.completion_item.label = entry.completion_item.label:gsub("\n", "")

        local highlights_info = require("colorful-menu").cmp_highlights(entry)

        -- highlight_info is nil means we are missing the ts parser, it's
        -- better to fallback to use default `vim_item.abbr`. What this plugin
        -- offers is two fields: `vim_item.abbr_hl_group` and `vim_item.abbr`.
        if highlights_info ~= nil then
          vim_item.abbr_hl_group = highlights_info.highlights
          vim_item.abbr = highlights_info.text
        end
        local strings = vim.split(kind.kind, "%s", { trimempty = true })
        vim_item.kind = (strings[1] or "") .. " "
        vim_item.menu = ""

        return vim_item
      end,
    },
    sources = {
      { name = 'nvim_lsp_signature_help', priority = 1001 },
      { name = "nvim_lsp",                priority = 1000 },
      { name = 'copilot',                 prority = 750 },
      { name = "path",                    priority = 500 },
      { name = "luasnip",                 priority = 250 },
    },
    snippet = {
      expand = function(args)
        local luasnip = require('luasnip')
        if not luasnip then
          -- You need Neovim v0.10 to use vim.snippet
          vim.snippet.expand(args.body)
        else
          require('luasnip').lsp_expand(args.body)
        end
      end,
    },
    completion = {
      completeopt = 'menu,menuone,noinsert'
    },
    preselect = cmp.PreselectMode.Item,
    mapping = cmp.mapping.preset.insert({
      ["<C-u>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.mapping.scroll_docs(-4)()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ["<C-d>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.mapping.scroll_docs(4)()
        else
          fallback()
        end
      end, { 'i', 's' }),
    }),
  })
end

cmp_setup()
