return {
	{
		-- Motor de snippets.
		"L3MON4D3/LuaSnip",
		dependencies = {
			-- Concexión con cmp.
			"saadparwaiz1/cmp_luasnip",
			-- Añade snippets de vscode.
			"rafamadriz/friendly-snippets",
		},
	},
	{
		-- Conexión entre LSP y cmp.
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		-- Este es el motor de autocompletado, requiere fuentes.
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				completion = {
					completeopt = "menu,menuone,select",
				},
				-- Registra lasnip cómo una fuente de snippets del motor
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.scroll_docs(-4),
					["<C-n>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.abort(),
				}),
				-- Fuentes de completado en orden de prioridad.
                -- fuente
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},
}
