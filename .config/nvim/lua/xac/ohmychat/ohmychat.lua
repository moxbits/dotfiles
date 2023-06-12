-- creating an interface to connect with ohmychat app

local M = {}

local sys_call = vim.fn.system

function M.prompt(message)
	sys_call([[ohmychat --profile neovim --message message]])
end

function M.generate_code(message) end

function M.explain(message) end

function M.write_testcase(message) end

function M.refactor(message) end

function M.comment_lines(message) end

function M.debug(message) end

function M.autocomplete(message) end

return M
