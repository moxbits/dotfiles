local M = {}

function M.create_new_file()
	-- Set the default file path
	local pwd = vim.fn.getcwd()
	local default_path = pwd .. "/new_file.txt"

	-- Ask the user for the desired file path
	local file_path = vim.fn.input("Enter the file path: ", default_path)

	-- Check if the file path is not empty
	if file_path ~= "" then
		-- Create the new file
		vim.cmd("e " .. file_path)
		-- Save the new file
		vim.cmd("write")
	else
		-- Print an error message if the user didn't provide a file path
		print("No file path provided.")
	end
end

return M
