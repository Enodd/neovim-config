return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = { "latex", "bibtex", "lua", "vim" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "latex" },
      },
      indent = { enable = true },
    })
  end,
}
