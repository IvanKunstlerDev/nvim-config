vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when copying text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
	pattern = {
		"PlenaryTestPopup",
		"checkhealth",
		"dbout",
		"gitsigns-blame",
		"grug-far",
		"help",
		"lspinfo",
		"neotest-output",
		"neotest-output-panel",
		"neotest-summary",
		"notify",
		"qf",
		"spectre_panel",
		"startuptime",
		"tsplayground",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.schedule(function()
			vim.keymap.set("n", "q", function()
				vim.cmd("close")
				pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
			end, {
				buffer = event.buf,
				silent = true,
				desc = "Quit buffer",
			})
		end)
	end,
})

vim.api.nvim_create_autocmd("VimLeave", {
	callback = function()
		vim.opt.guicursor = "a:ver25"
	end,
	desc = "Restore cursor on leave nvim",
})

-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
-- 	callback = function(data)
-- 		-- buffer is a real file on the disk
-- 		local real_file = vim.fn.filereadable(data.file) == 1
--
-- 		-- buffer is a [No Name]
-- 		local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
--
-- 		if not real_file and not no_name then
-- 			return
-- 		end
--
-- 		-- open the tree, find the file but don't focus it
-- 		require("nvim-tree.api").tree.toggle({ focus = false, find_file = true })
-- 	end,
-- })

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		local hl = vim.api.nvim_set_hl
		local nf = vim.api.nvim_get_hl(0, { name = "NormalFloat", link = false })

		-- Telescope
		hl(0, "TelescopeNormal", { link = "NormalFloat" })
		hl(0, "TelescopePromptNormal", { link = "NormalFloat" })
		hl(0, "TelescopeResultsNormal", { link = "NormalFloat" })
		hl(0, "TelescopePreviewNormal", { link = "NormalFloat" })
		hl(0, "TelescopeBorder", { bg = nf.bg, fg = nf.bg })
		hl(0, "TelescopePromptBorder", { bg = nf.bg, fg = nf.bg })
		hl(0, "TelescopeResultsBorder", { bg = nf.bg, fg = nf.bg })
		hl(0, "TelescopePreviewBorder", { bg = nf.bg, fg = nf.bg })

		-- Blink
		hl(0, "BlinkCmpMenuBorder", { bg = nf.bg, fg = nf.bg })

		-- Noice
		hl(0, "NoiceCmdlinePopup", { link = "NormalFloat" })
		hl(0, "NoiceCmdlinePopupBorder", { bg = nf.bg, fg = nf.bg })
	end,
})
