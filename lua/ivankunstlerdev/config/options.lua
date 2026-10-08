local opt = vim.opt

-- Clipboard
vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)

-- UI
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.numberwidth = 5
opt.showtabline = 0
opt.laststatus = 0
opt.cmdheight = 0
vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

-- Signs
opt.signcolumn = "yes:1"
opt.statuscolumn = "%=%{v:relnum?v:relnum:v:lnum}%s"

-- Indent
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Text
opt.wrap = true
opt.linebreak = true
opt.breakindent = true
opt.textwidth = 0
opt.colorcolumn = ""
opt.spell = false

-- Movement
opt.cursorline = false
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Split
opt.splitbelow = true
opt.splitright = true

-- File
opt.undofile = true
opt.updatetime = 250

-- Completion and cmd
opt.completeopt = { "menu", "menuone", "noselect" }
opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.showcmd = true
opt.showmode = false
