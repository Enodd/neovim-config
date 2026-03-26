local theme_file = vim.fn.expand("~/.nvim_theme")
local f = io.open(theme_file, "r")
local theme = f and f:read("*l") or "dark"
if f then
  f:close()
end

return {
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = theme
      vim.g.everforest_background = "medium"
      vim.g.everforest_transparent_background = 2
      vim.g.everforest_better_performance = 1
      vim.cmd("colorscheme everforest")
    end,
  },
}
