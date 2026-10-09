vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.timeoutlen = 200

local kmap = vim.keymap.set
kmap("n", "<Esc>", "<CMD>nohlsearch<CR>")

kmap("n", "<C-h>", "<C-w>h")
kmap("n", "<C-j>", "<C-w>j")
kmap("n", "<C-k>", "<C-w>k")
kmap("n", "<C-l>", "<C-w>l")

kmap("n", "<S-h>", "<CMD>bprevious<CR>", { desc = "Next buffer" })
kmap("n", "<S-l>", "<CMD>bnext<CR>", { desc = "Prev buffer" })
kmap("n", "<leader>bd", function()
  local current_buffer = vim.api.nvim_get_current_buf()
  local buffers = #vim.fn.getbufinfo({ buflisted = 1 })

  local function close_buffer()
    if buffers > 1 then
      vim.cmd("bprevious")
    else
      vim.cmd("enew")
    end
    vim.api.nvim_buf_delete(current_buffer, { force = true })
  end

  if not vim.bo[current_buffer].modified then
    close_buffer()
    return
  end

  vim.ui.input({
    prompt = "Close buffer without saving? (y/N): ",
  }, function(input)
    local affirmative = {
      y = true,
      yes = true,
      s = true,
      si = true,
      ["1"] = true,
    }

    if input and affirmative[input:lower()] then
      close_buffer()
    end
  end)
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
