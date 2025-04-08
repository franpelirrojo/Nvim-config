return {
	"rebelot/kanagawa.nvim",
	config = function()
		require("kanagawa").setup({
			transparent = true,
			overrides = function(colors)
				local theme = colors.theme
				return {
					TelescopeTitle = { fg = theme.ui.special, bold = true },
					TelescopePromptNormal = { bg = theme.ui.bg_p1 },
					TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
					TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
					TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
					TelescopePreviewNormal = { bg = theme.ui.bg_dim },
					TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
				}
			end,
			colors = {
				palette = {
					fujiGray = "#A1A08E", --Creo que era para los comentarios de java
				},
			},
		})
		vim.o.background = "dark"
		vim.cmd("colorscheme kanagawa")
	end,
}
