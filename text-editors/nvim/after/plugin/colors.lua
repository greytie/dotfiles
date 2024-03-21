function ColorMyPencils(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)

-- Supposed to make background transparent, doesn't seemto
-- work correctly with wezterm, figure out later
--	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
