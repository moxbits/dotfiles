local ok_fmt, formatter = pcall(require, "formatter")

if not ok_fmt then
	print("could not init formatter.nvim. maybe it is not installed!")
	return
end

local util = require("formatter.util")

formatter.setup({
	logging = true,
	log_level = vim.log.levels.WARN,

	filetype = {

		lua = {
			require("formatter.filetypes.lua").stylua,
			function()
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},

		python = {
			require("formatter.filetypes.python").black,
		},

		html = {
			require("formatter.filetypes.html").prettier,
		},
		css = {
			require("formatter.filetypes.css").prettier,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettier,
		},
		javascriptreact = {
			require("formatter.filetypes.javascriptreact").prettier,
		},
		typescriptreact = {
			require("formatter.filetypes.typescriptreact").prettier,
		},
		json = {
			require("formatter.filetypes.json").prettier,
		},

		php = {
			require("formatter.filetypes.php").php_cs_fixer,
		},
	},
})
