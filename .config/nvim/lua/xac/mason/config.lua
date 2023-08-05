local ok, mason = pcall(require, "mason")

if not ok then
	print("couldn't init the mason. maybe it is not installed!")
	return
end

-- init mason core
mason.setup {}

