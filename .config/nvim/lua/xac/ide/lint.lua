local ok_lint, lint = pcall(require, "lint")

if not ok_lint then
  print("could not init lint. maybe it is not installed")
  return
end

lint.linters_by_ft = {
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

vim.api.nvim_set_keymap("n", "<leader>L", ":lua require(\"lint\").try_lint()<CR>", {noremap = true, silent = true})

