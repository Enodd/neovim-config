return {
  -- {
  --   "sainnhe/everforest",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.g.everforest_background = "medium"
  --     vim.cmd("colorscheme everforest")
  --   end,
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd("colorscheme catppuccin")
    end,
  },
}
