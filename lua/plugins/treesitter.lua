return
{
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function ()
        local install = require('nvim-treesitter.install')
        install.prefer_git = false
        install.compilers = { "gcc" }

        require("nvim-treesitter.configs").setup({
            ensure_installed = { "vim" , "vimdoc" , "c" ,"cpp", "lua", "query", "java",
                    "markdown" ,"markdown_inline" ,"gitignore" },
            auto_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
