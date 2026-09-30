vim.cmd.colorscheme("vague")

local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = normal_hl.bg })