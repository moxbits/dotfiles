return {
  "williamboman/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim"
  },
  config = function()
    require("mason").setup()
    require("mason-tool-installer").setup({
      ensure_installed = {
        -- formatters
        "stylua", -- lua
        "black", -- python
        "shfmt", -- sh
        "prettier", -- html, css, js, ts, json
        "php-cs-fixer", -- php

        -- linters
        "luacheck", -- lua
        "eslint_d", -- js, ts
        "flake8", -- python
      },
    })
  end
}
