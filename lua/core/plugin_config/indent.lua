vim.api.nvim_set_hl(0, "IblIndent", { fg = "cyan" })
vim.api.nvim_set_hl(0, "IblWhitespace", { fg = "red" })
vim.api.nvim_set_hl(0, "IblScope", { fg = "blue" })

require("ibl").setup({
  enabled = true,
  indent = {
    char = "▎",
    highlight = { "Whitespace" },
  },
  whitespace = {
    highlight = { "Operator" },
  },
  scope = {
    highlight = { "Operator" },
    char = "▍",
    enabled = true,
    show_start = false,
    show_end = false,

  },
  exclude = {
    filetypes = {
      "help",
      "alpha",
      "dashboard",
      "neo-tree",
      "Trouble",
      "trouble",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
      "lazyterm",
    },
  },
})
