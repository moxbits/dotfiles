local M = {}

M.generate = function(lspconfig)
return {
			root_dir = function(pattern)
				local cwd = vim.loop.cwd()
				local root = lspconfig.util.root_pattern("composer.json", ".git", ".")(pattern)
				-- prefer cwd if root is a descendant
				return lspconfig.util.path.is_descendant(cwd, root) and cwd or root
			end
}
end

return M
