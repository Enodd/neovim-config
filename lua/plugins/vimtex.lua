return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    -- PDF viewer configuration (choose one based on your OS)
    -- For Linux: 'zathura', for macOS: 'skim', for Windows: 'sumatrapdf'
    vim.g.vimtex_view_method = "skim"

    -- Compiler configuration
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      build_dir = "build",
      callback = 1,
      continuous = 1,
      executable = "latexmk",
      options = {
        "-pdf",
        "-shell-escape",
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
      },
    }
    -- PDF viewer options for forward search
    vim.g.vimtex_view_general_viewer = "skim"

    -- Disable some features for better performance
    vim.g.vimtex_quickfix_mode = 0

    -- Enable folding
    vim.g.vimtex_fold_enabled = 1

    -- Syntax conceal configuration
    vim.g.vimtex_syntax_conceal = {
      accents = 1,
      ligatures = 1,
      cites = 1,
      fancy = 1,
      greek = 1,
      math_bounds = 0,
      math_delimiters = 1,
      math_fracs = 1,
      math_super_sub = 1,
      math_symbols = 1,
      sections = 0,
      styles = 1,
    }

    -- ToC configuration
    vim.g.vimtex_toc_config = {
      name = "TOC",
      layers = { "content", "todo", "include" },
      split_width = 30,
      todo_sorted = 0,
      show_help = 1,
      show_numbers = 1,
    }
  end,
}
