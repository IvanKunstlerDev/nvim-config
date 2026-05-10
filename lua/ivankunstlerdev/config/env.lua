local M = {}

M.is_nix = function()
    return vim.fn.executable("nix") == 1
end

return M
