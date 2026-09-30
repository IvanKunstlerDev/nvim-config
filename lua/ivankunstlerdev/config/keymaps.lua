vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.timeoutlen = 200

local kmap = vim.keymap.set
kmap("n", "<Esc>", "<CMD>nohlsearch<CR>")

kmap('n', '<C-h>', '<C-w>h')
kmap('n', '<C-j>', '<C-w>j')
kmap('n', '<C-k>', '<C-w>k')
kmap('n', '<C-l>', '<C-w>l')

kmap("n", "<S-h>", "<CMD>bprevious<CR>", { desc = "Next buffer" })
kmap("n", "<S-l>", "<CMD>bnext<CR>", { desc = "Prev buffer" })
kmap("n", "<leader>bd", function()
	local buffers = #vim.fn.getbufinfo({ buflisted = 1 })
	if buffers > 1 then
		vim.cmd("bp | bd #")
	else
		vim.cmd("enew | bd #")
	end
end, { desc = "Close current buffer" })

kmap("", "<leader>fr", function()
	local old_name = vim.fn.expand("%:p")
	local new_name = vim.fn.input("Nuevo nombre: ", old_name, "file")
	if new_name == "" or new_name == old_name then
		return
	end
	local new_dir = vim.fn.fnamemodify(new_name, ":h")
	if vim.fn.isdirectory(new_dir) == 0 then
		vim.fn.mkdir(new_dir, "p")
	end
	os.rename(old_name, new_name)
	vim.cmd.edit(new_name)
	vim.cmd.bdelete(old_name)
end, { desc = "Rename file" })

kmap("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
kmap("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
kmap("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
kmap("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
kmap("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
kmap("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
