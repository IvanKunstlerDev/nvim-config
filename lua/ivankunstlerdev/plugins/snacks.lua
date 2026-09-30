require("snacks").setup({
	picker = {
		enabled = true,
		sources = {
			explorer = {
				auto_close = false,
				jump = { close = false },
				layout = { preset = "sidebar", layout = { position = "right" } },
			},
		},
	},
	explorer = { enabled = true },
})

local snacks = require("snacks")
local picker = require("snacks.picker")

local map = function(keymap, fn, desc)
	vim.keymap.set("n", keymap, fn, { desc = desc, noremap = true })
end

map("<leader>e", function()
	snacks.explorer()
end, "Explorador de archivos")
map("<leader>ff", function()
	picker.files()
end, "Buscar archivos")
map("<leader>fg", function()
	picker.grep()
end, "Buscar palabras")
map("<leader>gd", function()
	picker.lsp_definitions()
end, "Lsp definiciones")
map("<leader>gD", function()
	picker.lsp_declarations()
end, "Lsp declaraciones")
map("<leader>gi", function()
	picker.lsp_implementations()
end, "Lsp implementaciones")
map("<leader>gx", function()
	picker.diagnostics()
end, "Buscar diagnosticos")

local group = vim.api.nvim_create_augroup("snacks_explorer", { clear = true })

vim.api.nvim_create_autocmd("VimEnter", {
	group = group,
	callback = function()
		if vim.fn.argc() == 0 then
			snacks.explorer()
		end
	end,
})