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
  'nvim-tree/nvim-web-devicons',

  -- Beautiful status bar
  'nvim-lualine/lualine.nvim',

  "rcarriga/nvim-notify",


  -- Colorschemes
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000
  },
  { "catppuccin/nvim",                 as = "catppuccin" },
  { "folke/tokyonight.nvim" },
  { "ellisonleao/gruvbox.nvim",        priority = 1000,    config = true },

  -- File parsing
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Fuzzy file finding
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
  },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- LSP Zero for Language servers
  'VonHeikemen/lsp-zero.nvim',
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  -- LSP Support
  { 'neovim/nvim-lspconfig' },

  -- Typescript tools
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  },


  -- CMP
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'L3MON4D3/LuaSnip' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },

  { 'github/copilot.vim' },

  'echasnovski/mini.nvim',

  -- Show hunks in files
  "lewis6991/gitsigns.nvim",

  -- Practicing Vim motions
  "ThePrimeagen/vim-be-good",

  -- Harpoon for quick file navigation
  "ThePrimeagen/harpoon",

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
    end
  },
  -- Vim git
  "tpope/vim-fugitive",

  -- Git tree
  "rbong/vim-flog",

  -- Aerial
  "stevearc/aerial.nvim",

  -- Better Diagnostics
  "dgagn/diagflow.nvim",

  -- Trouble
  "folke/trouble.nvim",

  -- Surround Words/Text with quotes, brackets etc.
  "tpope/vim-surround",

  "utilyre/barbecue.nvim",

  "nvim-pack/nvim-spectre",

  { "lukas-reineke/indent-blankline.nvim", main = 'ibl', opts = {} },

  "HiPhish/rainbow-delimiters.nvim",

  -- CSS colour highlighter
  "ap/vim-css-color",

  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end
  },

  "echasnovski/mini.indentscope",

  "SmiteshP/nvim-navbuddy",

  "SmiteshP/nvim-navic",

  "MunifTanjim/nui.nvim",

  "numToStr/Comment.nvim",

  "stevearc/dressing.nvim",

  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod',                     lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  'vim-scripts/dbext.vim',

  -- Minesweeper >:)
  "seandewar/nvimesweeper",
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
}, {})
