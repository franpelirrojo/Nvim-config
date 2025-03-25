return {
	{
		-- Gestiona e instala LSP local
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					border = "rounded",
				},
			})
		end,
	},
	{
		-- Rellena el hueco entre el cliente lsp de nvim y los servidores
		-- de mason. Para configuración específica del comportamiento del LSP
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "jdtls" },
			})
		end,
	},
	{
		-- Lo mismo que mason-lsp pero con daps mediante nvim-dap
		"jay-babu/mason-nvim-dap.nvim",
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = { "java-debug-adapter", "java-test" },
			})
		end,
	},
	{
		"mfussenegger/nvim-jdtls",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
	{
		-- Permite la comunicación entre nvim y los LSP
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			-- Conexión con el motor de autocompletado
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "[C]ode [H]over Documentation" })
            vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "[C]ode Goto [D]efinition" })
            vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "[C]ode Goto [D]eclaration" })
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
            vim.keymap.set( "n", "<leader>cr", require("telescope.builtin").lsp_references, { desc = "[C]ode Goto [R]eferences" })
            vim.keymap.set( "n", "<leader>ci", require("telescope.builtin").lsp_implementations, { desc = "[C]ode Goto [I]mplementations" })
            vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })

			-- Configurar cada servidor. Excepto java y php que requieren configuraciones especiales
			local servers = { "angularls", "html", "ts_ls", "cssls", "marksman", "sqlls" }
			for _, lsp in pairs(servers) do
				lspconfig[lsp].setup({
					capabilities = capabilities,
				})
			end

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        -- Le damos al lsp el contexto de las funciones de nvim y sus plugins
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                    },
                },
            })


		end,
	},
}
