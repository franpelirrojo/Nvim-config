return{
    { 
        "ellisonleao/gruvbox.nvim", 
        config = function()
            vim.o.background = "light"
            vim.cmd([[colorscheme gruvbox]])
        end
    },

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function() --Mapeamos las teclas de busqueda
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', 'C-p', builtin.git_files, {})
            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") });
            end)
        end
    },

    {
        "nvim-treesitter/nvim-treesitter",
        config = function ()
            local install = require('nvim-treesitter.install')
            install.prefer_git = false
            install.compilers = { "clang" }

            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },

    {
        'ThePrimeagen/harpoon',
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")
            
            --Mapeamos las teclas de navegación
            vim.keymap.set("n", "<leader>a", mark.add_file)
            vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

            vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
            vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
            vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
            vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
        end
    },
        
    {
        'mbbill/undotree',
        config = function() 
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },

    -- LSP Support
    {
        'VonHeikemen/lsp-zero.nvim', 
        branch = 'v3.x',
        lazy = true,
    -- install without yarn or npm
        config = false,
    },

    -- Autocompletion
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},

    -- Mason
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'neovim/nvim-lspconfig'},

    --preview markdown
    {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    }
}
