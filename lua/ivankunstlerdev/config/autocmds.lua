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
		local nf = vim.api.nvim_get_hl(0, { name = "NormalFloat", link = false })
		local hl = vim.api.nvim_set_hl

		local link_to_normal_float = function(highlight)
			hl(0, highlight, { link = "NormalFloat" })
		end

		local link_to_inverse_normal_float = function(highlight)
			hl(0, highlight, { bg = nf.bg, fg = nf.bg })
		end

		-- Telescope
		link_to_normal_float("TelescopeNormal")
		link_to_normal_float("TelescopePromptNormal")
		link_to_normal_float("TelescopeResultsNormal")
		link_to_normal_float("TelescopePreviewNormal")
		link_to_inverse_normal_float("TelescopeBorder")
		link_to_inverse_normal_float("TelescopePromptBorder")
		link_to_inverse_normal_float("TelescopeResultsBorder")
		link_to_inverse_normal_float("TelescopePreviewBorder")

		-- Blink
		link_to_inverse_normal_float("BlinkCmpMenuBorder")
		link_to_normal_float("BlinkCmpMenu")
		link_to_normal_float("BlinkCmpSource")

		-- Noice
		link_to_normal_float("NoiceCmdlineIcon")
		link_to_normal_float("NoiceCmdlinePopup")
		link_to_inverse_normal_float("NoiceCmdlinePopupBorder")

		-- Match brackets
		vim.api.nvim_set_hl(0, "MatchParen", { underline = true, bold = false, fg = "None", bg = "None" })
	end,
})

-- Show/hide diagnostics
vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.diagnostic.hide()
	end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		vim.diagnostic.show()
	end,
})

-- Show/hide tmux status bar
vim.api.nvim_create_autocmd({ "VimEnter", "VimResume" }, {
	callback = function()
		if vim.env.TMUX ~= nil then
			vim.system({ "tmux", "set", "status", "off" })
		end
	end,
})

vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
	callback = function()
		if vim.env.TMUX ~= nil then
			vim.system({ "tmux", "set", "status", "on" })
		end
	end,
})
