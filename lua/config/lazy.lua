local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

require("conform").setup({
  formatters_by_ft = {
    svelte = { "eslint_d" },
    typescript = { "eslint_d" },
    javascript = { "eslint_d" },
    javascriptreact = { "eslint_d" },
    typescriptreact = { "eslint_d" },
    php = { "phpbcf" },
    html = { "prettier" },
    css = { "prettier" },
  },
  formatters = {
    eslint_d = {
      condition = require("conform.util").root_file({
        ".eslintrc",
        ".eslintrc.js",
        ".eslintrc.cjs",
        ".eslintrc.mjs",
        ".eslintrc.json",
        "eslint.config.js",
        "eslint.config.mjs",
        "eslint.config.cjs",
      }),
      cwd = require("conform.util").root_file({ "package.json" }),
    },
    -- php_cs_fixer = {
    --   command = "php-cs-fixer",
    --   args = { "fix", "$FILENAME" },
    --   stdin = false,
    --   cwd = require("conform.util").root_file({ "composer.json" }),
    -- },
    phpbcf = {
      command = "phpcbf",
      args = function(ctx)
        return {
          "--standard=" .. vim.fn.getcwd() .. "/.phpcs.xml",
          "$FILENAME",
        }
      end,
      stdin = false,
      cwd = require("conform.util").root_file({ ".phpcs.xml", "composer.json" }),
    },
    prettier = {
      prepend_args = {
        "--tab-width",
        "4",
        "--use-tabs",
        "false",
      },
    },
  },
})
