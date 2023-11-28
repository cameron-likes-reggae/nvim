local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- File icons for file explorer
  use 'nvim-tree/nvim-web-devicons'

  -- Beautiful status bar
  use 'nvim-lualine/lualine.nvim'

  -- Nightfly colorsheme
  use {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000
  }

  -- Catppuccin Colour Scheme
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Tokyo Night Colour Scheme
  use { "folke/tokyonight.nvim" }

  -- File parsing
  use 'nvim-treesitter/nvim-treesitter'

  -- Fuzzy file finding
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- LSP Zero for Language servers
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    }
  }
  use { 'neovim/nvim-lspconfig' }

  use 'echasnovski/mini.nvim'
  -- Show hunks in files
  use "lewis6991/gitsigns.nvim"

  -- Practicing Vim motions
  use "ThePrimeagen/vim-be-good"

  -- nerdcommenter for quick commenting of lines
  use "preservim/nerdcommenter"

  -- Harpoon for quick file navigation
  use "ThePrimeagen/harpoon"

  -- Dracula Colorscheme
  use "Mofiqul/dracula.nvim"

  -- File Explorer Plugin
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    }
  }
  use {
    "themaxmarchuk/tailwindcss-colors.nvim",
    -- load only on require("tailwindcss-colors")
    module = "tailwindcss-colors",
    -- run the setup function after plugin is loaded
    config = function()
      -- pass config options here (or nothing to use defaults)
      require("tailwindcss-colors").setup()
    end
  }
  -- Vim git
  use "tpope/vim-fugitive"

  -- Git tree
  use "rbong/vim-flog"

  -- Aerial
  use "stevearc/aerial.nvim"

  -- Better Diagnostics
  use "dgagn/diagflow.nvim"

  -- Trouble
  use "folke/trouble.nvim"

  -- Surround Words/Text with quotes, brackets etc.
  use "tpope/vim-surround"

  use({
    "utilyre/barbecue.nvim",
    requires = {
      "SmiteshP/nvim-navic",
    },
  })
  use 'nvim-pack/nvim-spectre'
  use "lukas-reineke/indent-blankline.nvim"

  -- CSS colour highlighter
  use "ap/vim-css-color"

  use "echasnovski/mini.indentscope"

  use {
    "SmiteshP/nvim-navbuddy",
    requires = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
      "numToStr/Comment.nvim",        -- Optional
      "nvim-telescope/telescope.nvim" -- Optional
    }
  }


  -- Minesweeper >:)
  use "seandewar/nvimesweeper"
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
