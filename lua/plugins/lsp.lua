return {
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  {
    'hrsh7th/nvim-cmp',
    opts = {
      window = {
        completion = {
          border = "none",
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:NormalFloat",
        }
      }
    },
  },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<M-y>",
          dismiss = "<M-]>",
        },
      },
      panel = { enabled = false },
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter.configs').setup({
        context_commentstring = {
          config = {
            javascript = {
              __default = '// %s',
              jsx_element = '{/* %s */}',
              jsx_fragment = '{/* %s */}',
              jsx_attribute = '// %s',
              comment = '// %s',
            },
            typescript = { __default = '// %s', __multiline = '/* %s */' },
          },
        }
      })
    end,
  }
}
--
--   {
--     "folke/lsp-colors.nvim",
--   },
--
--   -- LSP Zero for Language servers
--   "VonHeikemen/lsp-zero.nvim",
--   { "williamboman/mason.nvim" },
--   { "williamboman/mason-lspconfig.nvim" },
--   -- LSP Support
--   { "neovim/nvim-lspconfig" },
--   { "stevearc/conform.nvim",            opts = {} },
--   { "tikhomirov/vim-glsl" },
--
--   -- CMP
--   { "hrsh7th/nvim-cmp" },
--   { "hrsh7th/cmp-nvim-lsp" },
--   { "hrsh7th/cmp-buffer" },
--   { "hrsh7th/cmp-path" },
--   { "hrsh7th/cmp-cmdline" },
--   { "hrsh7th/cmp-calc" },
--   { "onsails/lspkind.nvim" },
--   {
--     "zbirenbaum/copilot.lua",
--     cmd = "Copilot",
--     event = "InsertEnter",
--     config = function()
--       require("copilot").setup({
--         suggestion = {
--           enabled = true,
--           auto_trigger = true,
--           keymap = {
--             accept = "<M-y>",
--             dismiss = "<M-]>",
--           },
--         },
--         panel = { enabled = false },
--       })
--     end,
--   },
--
--   -- Diagnostics
--   { "folke/trouble.nvim" },
--   { "dgagn/diagflow.nvim" },
--
--
--   {
--     "JoosepAlviste/nvim-ts-context-commentstring",
--     opts = {}
--   }
--
-- }
