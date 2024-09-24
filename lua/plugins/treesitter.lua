return 
{
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function ()
        local install = require('nvim-treesitter.install')
        install.prefer_git = false
        install.compilers = { "gcc", "clang" }

        require("nvim-treesitter.configs").setup({
            ensure_installed = { "vim" , "vimdoc" , "c" , "lua" ,"cpp", "lua", "query", "java",
                    "markdown" ,"markdown_inline" ,"gitignore" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
