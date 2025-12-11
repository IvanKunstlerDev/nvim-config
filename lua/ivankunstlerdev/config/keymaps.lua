local map = vim.keymap.set

-- Clear search highlight
map("n", "<Esc>", "<CMD>nohlsearch<CR>")

-- Exit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>")

-- Move between splits
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Move lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Delete buffer
map("n", "<Leader>bd", "<CMD>bdelete<CR>", { desc = "Close current buffer" })
-- Previous buffer
map("n", "<S-h>", "<CMD>bprevious<CR>")
-- Next buffer
map("n", "<S-l>", "<CMD>bnext<CR>")

-- Lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- New file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
-- Rename file
map("", "<leader>fr", function()
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

-- Find notes
map("n", "<leader>ns", function()
	local notes_dir = vim.fn.expand("~/.notes")
	if vim.fn.isdirectory(notes_dir) == 0 then
		vim.fn.mkdir(notes_dir, "p")
	end
	require("telescope.builtin").find_files({ cwd = notes_dir })
end, { desc = "Telescope notes" })
-- Create notes
map("n", "<leader>nn", function()
	local notes_dir = vim.fn.expand("~/.notes")
	if vim.fn.isdirectory(notes_dir) == 0 then
		vim.fn.mkdir(notes_dir, "p")
	end
	local note_name = vim.fn.input("Nombre de la nota: ")
	if not note_name:match("%.md$") then
		note_name = note_name .. ".md"
	end
	local path = notes_dir .. "/" .. note_name
	vim.cmd.edit(path)
end, { desc = "New note" })
