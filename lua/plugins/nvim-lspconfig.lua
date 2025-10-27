return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "texlab" },
    })

    local lspconfig = require("lspconfig")

    -- texlab (LaTeX LSP)
    lspconfig.texlab.setup({
      settings = {
        texlab = {
          build = {
            executable = "latexmk",
            args = {
              "-pdf",
              "-interaction=nonstopmode",
              "-synctex=1",
              "-outdir=build",
              "%f",
            },
            onSave = true,
            forwardSearchAfter = false,
          },
          auxDirectory = "build",
          forwardSearch = {
            executable = "skim",
            args = { "--synctex-forward", "%l:1:%f", "%p" },
          },
          chktex = {
            onOpenAndSave = true,
            onEdit = false,
          },
          diagnosticsDelay = 300,
          latexFormatter = "latexindent",
          latexindent = {
            ["local"] = nil,
            modifyLineBreaks = false,
          },
        },
      },
    })
  end,
}
