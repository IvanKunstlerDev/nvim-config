return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	-- build = "make install_jsregexp"
	dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		local ls = require("luasnip")
		local snippets_dir = vim.fn.expand("$HOME/.config/nvim/lua/ivankunstlerdev/snippets/")

		require("luasnip.loaders.from_vscode").load({
			exclude = { "typescript", "typescriptreact" },
		})
		require("luasnip.loaders.from_lua").load({ paths = snippets_dir })

		local map = vim.keymap.set

		map({ "n" }, "<TAB>", function()
			ls.jump(1)
		end, { silent = true })
		map({ "n" }, "<S-TAB>", function()
			ls.jump(-1)
		end, { silent = true })
	end,
}
