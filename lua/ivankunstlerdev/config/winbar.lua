local severity_name = {
	[1] = "error",
	[2] = "warning",
	[3] = "info",
	[4] = "hint",
	[5] = "other",
}

local get_most_several_diagnostic = function(diagnostics)
	if diagnostics == nil or diagnostics == {} then
		return nil
	end
	local max = #severity_name
	for _, err in ipairs(diagnostics["diagnostics"]) do
		if err then
			local sev_num = err.severity
			if sev_num and sev_num < max then
				max = sev_num
			end
		end
	end
	local max_severity = severity_name[max]
	return max_severity
end

local get_filename_hl = function(diagnostic_level)
	local base_hl = "WinBar"
	if diagnostic_level == "error" then
		base_hl = "DiagnosticError"
	elseif diagnostic_level == "warning" then
		base_hl = "DiagnosticWarn"
	elseif diagnostic_level == "info" then
		base_hl = "DiagnosticInfo"
	elseif diagnostic_level == "hint" then
		base_hl = "DiagnosticHint"
	end

	if vim.bo.modified then
		local new_hl = base_hl .. "Italic"
		if vim.fn.hlexists(new_hl) == 0 then
			local hl_def = vim.api.nvim_get_hl(0, { name = base_hl })
			vim.api.nvim_set_hl(0, new_hl, {
				bg = hl_def.bg,
				fg = hl_def.fg,
				italic = true,
			})
		end
		return new_hl
	end

	return base_hl
end

local get_winbar = function(opts)
	local filename = vim.fn.expand("%:t")
	if filename == "" then
		return ""
	end

	local icon, icon_hl = require("nvim-web-devicons").get_icon(filename, nil, { default = true })

	local most_several_diagnostic = get_most_several_diagnostic(opts.diagnostics)
	local file_hl = get_filename_hl(most_several_diagnostic)

	local numberwidth = vim.o.numberwidth
	local signcolumn = vim.o.signcolumn == "no" and 0 or 2
	local left_margin = 0
	local padding = string.rep(" ", numberwidth + signcolumn + left_margin)

	return padding .. "%#" .. icon_hl .. "#" .. icon .. " %#" .. file_hl .. "#" .. filename .. "%*"
end

vim.api.nvim_create_autocmd({ "VimEnter", "BufEnter", "BufModifiedSet", "WinEnter", "WinLeave", "DiagnosticChanged" }, {
	callback = function(args)
		local bar = get_winbar({ diagnostics = args.data })
		vim.api.nvim_set_option_value("winbar", bar, { scope = "local" })
	end,
})
