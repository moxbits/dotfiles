return {
  "mfussenegger/nvim-lint",
  config = function()
    require("lint").linters_by_ft = {
      lua = {
        "luacheck",
      },
      python = {
        "flake8",
      },
      javascript = {
        "eslint",
      },
      typescript = {
        "eslint",
      },
      typescriptreact = {
        "eslint",
      },
      javascriptreact = {
        "eslint",
      },
    }
  end
}
