local keymap = vim.keymap.set

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "Go to declaration"
        keymap("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Go to definition"
        keymap("n", "gd", vim.lsp.buf.definition, opts)

        opts.desc = "Show LSP References"
        keymap("n", "gr", "<CMD>Telescope lsp_references<CR>", opts)

        opts.desc = "Show LSP implementations"
        keymap("n", "gi", "<CMD>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        keymap("n", "gt", "<CMD>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "See available code actions"
        keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        keymap("n", "<leader>cr", vim.lsp.buf.rename, opts)

        opts.desc = "Show buffer diagnostics"
        keymap("n", "<leader>D", "<CMD>Telescope diagnostics<CR>", opts)

        opts.desc = "Show line diagnostics"
        keymap("n", "<leader>d", vim.diagnostic.open_float, opts)

        opts.desc = "Go to previous diagnostic"
        keymap("n", "[d", function()
            vim.diagnostic.jump({ count = -1, float = true })
        end, opts)

        opts.desc = "Go to next diagnostic"
        keymap("n", "]d", function()
            vim.diagnostic.jump({ count = 1, float = true })
        end, opts)

        opts.desc = "Show documentation"
        keymap("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Restart LSP"
        keymap("n", "<leader>rs", "<CMD>LspRestart<CR>", opts)
    end
})
