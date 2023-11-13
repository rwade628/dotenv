local M = {
  "lukas-reineke/indent-blankline.nvim",
  -- commit = "8299fe7703dfff4b1752aeed271c3b95281a952d",
  main = "ibl",
  event = "BufReadPre",
}

M.opts = {
  indent = {
    char = "│",
    tab_char = "│",
  },
  scope = { enabled = false },
  exclude = {
    filetypes = {
      "help",
      "alpha",
      "dashboard",
      "neo-tree",
      "Trouble",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
      "lazyterm",
    },
  },
}

return M
