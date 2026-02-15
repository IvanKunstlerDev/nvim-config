local opt = vim.o

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.g.maplocalleader = " "

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes:1"
opt.statuscolumn = "%=%{v:relnum?v:relnum:v:lnum}%s"
opt.numberwidth = 5

opt.laststatus = 0

opt.mouse = "a"
opt.showmode = false

vim.schedule(function()
	opt.clipboard = "unnamedplus"
end)

opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.updatetime = 250
opt.timeoutlen = 300
opt.inccommand = "split"
opt.cursorline = true
opt.scrolloff = 8
opt.confirm = true
opt.linebreak = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.smartindent = true
opt.smoothscroll = true
opt.wrap = true
opt.termguicolors = true

vim.opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = ""
