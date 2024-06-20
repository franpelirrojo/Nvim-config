return 
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
}
