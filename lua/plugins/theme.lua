return 
{ 
    'rebelot/kanagawa.nvim', 
    config = function()
            require('kanagawa').setup({
                transparent = true,
            })
            vim.o.background = "dark"
            vim.cmd("colorscheme kanagawa")
    end
}
