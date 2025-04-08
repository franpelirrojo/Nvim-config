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
            debug = true,
			sources = {
				null_ls.builtins.formatting.stylua.with({
					filetypes = { "lua" },
				}),
				null_ls.builtins.formatting.prettierd.with({
					filetypes = { "html", "css", "markdown"},
				}),
				null_ls.builtins.formatting.sqruff.with({
					filetypes = { "sql" },
				}),
			},
		})

		vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "[C]ode [F]ormat" })
	end,
}
