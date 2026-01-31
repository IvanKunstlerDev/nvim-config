local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s("aff", {
		t({ "export const " }),
		i(1, "name"),
		t({ " = (" }),
		i(2, "args"),
		t({ ")" }),
		i(3, "return type"),
		t({ " => {", "" }),
		i(4, "code block"),
		t({ "", "};" }),
	}),
}
