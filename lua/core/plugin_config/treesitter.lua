require'nvim-treesitter.configs'.setup {

  ensure_installed = { "lua", "typescript", "tsx", "c" },

  sync_install = false,
  auto_install = true,
  hightlight = {
    enable = true,
  },
}
