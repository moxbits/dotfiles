local M = {}

M.setup = function(default_opts)
	return {
		on_attach = default_opts.on_attach,
		capabilities = default_opts.capabilities,
	}
end

return M
