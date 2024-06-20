return{
    { 
        'ellisonleao/gruvbox.nvim', 
        config = function()
            vim.o.background = "light"
            vim.cmd([[colorscheme gruvbox]])
        end
    },
    {
        --[[
        --  Treesitter, al menos en mi ordenar, requiere clang y las herramientas
        --  de LLVM. Está configurado pra que mantenga actualizado c, cpp y lua,
        --  y proporcione las funcionalidades dásicas de tabulación y coloreado.
        --  La etiqueta de gcc est´apor sia caso clang no se puede ejecutar, que lo
        --  intente con gcc.
        --]]
        'nvim-treesitter/nvim-treesitter',
        config = function ()
            local install = require('nvim-treesitter.install')
            install.prefer_git = false
            install.compilers = { "clang", "gcc" }

            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "cpp", "lua", "query" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', builtin.find_files, {}) -- Project files
            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") }); -- Project search
            end)
        end
    },
    { 
        -- Dependencia de Telescope para un mejor rendimiento.
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' 
    },
    {
        'ThePrimeagen/harpoon',
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>a", mark.add_file)
            vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

            vim.keymap.set("n", "<C-t>", function() ui.nav_file(1) end)
            vim.keymap.set("n", "<C-h>", function() ui.nav_file(2) end)
        end
    },
    {
        'mbbill/undotree',
        config = function() 
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },

    -- LSPzero
    { 
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        confing = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({buffer = bufnr})
            end)

            local cmp = require('cmp')
            local cmp_select = {behavior = cmp.SelectBehavior.Select}
            cmp.setup({
                sources = {
                    {name = 'path'},
                    {name = 'nvim_lsp'},
                    {name = 'nvim_lua'},
                    {name = 'luasnip', keyword_length = 2},
                    {name = 'buffer', keyword_length = 3},
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-Space>'] = cmp.mapping.complete(),
                }),
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end
                },
            })
        end
    },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },

    -- Mason
    {
        "williamboman/mason.nvim",
        config = function()
            require('mason').setup({})
        end
    },
    -- Plugins para lsp
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end
                },
            })
        end
    }
}

