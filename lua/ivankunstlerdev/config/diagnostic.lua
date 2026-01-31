vim.diagnostic.config({
	signs = false,
	underline = true,
	virtual_lines = false,
	virtual_text = {
		spacing = 1,
		prefix = "●",
		hl_mode = "combine",
		source = false,
	},
	severity_sort = true,
})
