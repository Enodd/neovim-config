-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

-- vim.g.lazyvim_php_lsp = "intelephense"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
    -- Enable spell checking
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "pl_PL"

    -- Text width and wrapping
    vim.opt_local.textwidth = 80
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true

    -- Indentation
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.expandtab = true

    -- Conceal level for prettier LaTeX
    vim.opt_local.conceallevel = 2

    -- Enable folding
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "vimtex#fold#level(v:lnum)"
    vim.opt_local.foldtext = "vimtex#fold#text()"
    vim.opt_local.foldenable = true
    vim.opt_local.foldlevel = 99
  end,
})

vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<CR>", { desc = "Toggle continuous compilation" })
vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<CR>", { desc = "View PDF" })
vim.keymap.set("n", "<leader>lc", "<cmd>VimtexClean<CR>", { desc = "Clean auxiliary files" })
vim.keymap.set("n", "<leader>lC", "<cmd>VimtexClean!<CR>", { desc = "Clean all output files" })
vim.keymap.set("n", "<leader>lt", "<cmd>VimtexTocToggle<CR>", { desc = "Toggle TOC" })
vim.keymap.set("n", "<leader>li", "<cmd>VimtexInfo<CR>", { desc = "VimTeX info" })
vim.keymap.set("n", "<leader>ls", "<cmd>VimtexStatus<CR>", { desc = "Compilation status" })
vim.keymap.set("n", "<leader>le", "<cmd>VimtexErrors<CR>", { desc = "Show errors" })
