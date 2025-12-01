local map = vim.keymap.set

-- clear search
map("n", "<Esc>", "<CMD>nohlsearch<CR>")

-- exit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>")

-- move between splits
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- delete buffer
map("n", "<Leader>bd", "<CMD>bdelete<CR>", { desc = "Close current buffer" })
-- previous buffer
map("n", "<S-h>", "<CMD>bprevious<CR>")

-- next buffer
map("n", "<S-l>", "<CMD>bnext<CR>")

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
