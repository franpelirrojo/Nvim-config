return {
	-- Envuelve herramientas CLI para integrarlas en nvim.
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		-- Declaramos los formatters o linters instalados en el sistema o
		-- mediante Mason
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.mdformat.with({
				    filetypes = { "markdown" },
				}),
				null_ls.builtins.formatting.prettierd.with({
					filetypes = { "html", "css" },
				}),
			},
		})

		vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "[C]ode [F]ormat" })
	end,
}
