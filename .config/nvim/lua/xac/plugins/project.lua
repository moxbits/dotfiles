local ok, project = pcall(require, "project_nvim")

if not ok then
	print("could not init project_nvim. maybe it is not installed")
	return
end

project.setup({})
