local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	s(
		"rfc",
		fmt(
			[[
			interface Props {}

			export const {} = ({}: Props) => {{
				return (
					{}
				)
			}}
			]],
			{
				i(1),
				i(2, "Component"),
				i(3),
				i(4),
			}
		)
	),
}
