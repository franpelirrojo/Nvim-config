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
                ensure_installed = { "c", "cpp", "lua" },
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
    }
}

