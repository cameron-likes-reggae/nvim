local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}

local identifier = vim.api.nvim_get_hl_by_name("Identifier", true)

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = identifier.fg or "pink" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#d79921" })
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#458588" })
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#d65d0e" })
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98971a" })
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#b16286" })
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#689d6a" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }

require("ibl").setup({
  indent = {
    -- char = "▏",
    -- tab_char = "▏",
    highlight = highlight
  },
  scope = { highlight = highlight, enabled = true },
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

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
