-- Toggle spell checking command
vim.api.nvim_create_user_command("ToggleSpellCheck", function()
	if vim.wo.spell then
		vim.wo.spell = false
		print("Spell checking disabled")
	else
		vim.wo.spell = true
		print("Spell checking enabled")
	end
end, {})

-- Copy :messages to clipboard command
vim.api.nvim_create_user_command("CopyMessages", function()
	local messages = vim.fn.execute("messages")
	vim.fn.setreg("+", messages) -- Copy to system clipboard (requires clipboard support)
	print("Copied :messages")
end, {})

-- Open :messages in a scratch buffer (unsaved, temporary) command
vim.api.nvim_create_user_command("MessagesBuffer", function()
	-- Get current window and buffer
	local current_win = vim.api.nvim_get_current_win()
	local current_buf = vim.api.nvim_get_current_buf()

	-- Create a new scratch buffer
	local new_buf = vim.api.nvim_create_buf(false, true) -- not listed, scratch
	vim.api.nvim_buf_set_name(new_buf, "Neovim Messages") -- optional name
	vim.api.nvim_buf_set_lines(new_buf, 0, -1, false, vim.split(vim.fn.execute("messages"), "\n"))

	-- Set scratch buffer options
	vim.bo[new_buf].buftype = "nofile" -- no file association
	vim.bo[new_buf].bufhidden = "wipe" -- wipe when hidden
	vim.bo[new_buf].swapfile = false -- no swapfile
	vim.bo[new_buf].filetype = "text" -- optional

	-- Replace current buffer with the new one
	vim.api.nvim_win_set_buf(current_win, new_buf)

	-- Close the old buffer if desired (avoids "buffer hidden" messages)
	vim.api.nvim_buf_delete(current_buf, { force = true })
end, {})
