return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	-- build = "make install_jsregexp"
	dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		local snippets_dir = vim.fn.expand("$HOME/.config/nvim/lua/ivankunstlerdev/snippets/")

		require("luasnip.loaders.from_vscode").load({
			exclude = { "javascript" },
		})
		require("luasnip.loaders.from_lua").load({ paths = snippets_dir })
	end,
}
