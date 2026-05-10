local servers = {
    "lua_ls",
    "html",
    "cssls",
    "tailwindcss",
    "vtsls",
    "prismals",
    "biome",
    "eslint",
    "pyright",
    "nil_ls",
    "jsonls"
}

return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = require("ivankunstlerdev.config.env").is_nix() and {} or servers
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)
            vim.lsp.enable(servers)
        end,
        dependencies = {
            {
                "mason-org/mason.nvim",
                opts = {}
            },
            {
                "neovim/nvim-lspconfig",
            }
        }
    },
    {
        "folke/lazydev.nvim",
        opts = {}
    }
}
