local M = {
  "alexghergh/nvim-tmux-navigation",
  lazy = false,
}

function M.config()
  local configs = require("nvim-tmux-navigation")

  configs.setup {
    disable_when_zoomed = true -- defaults to false
  }
end

return M
