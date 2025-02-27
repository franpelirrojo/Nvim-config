return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({})

            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        end
    },
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>ga", ":Git add .<cr>", {desc = "[G]it [A]dd"})
            vim.keymap.set("n", "<leader>gc", ":Git commit<cr>", {desc = "[G]it [C]ommit"})
            vim.keymap.set("n", "<leader>gp", ":Git push<cr>", {desc = "[G]it [P]ush"})
        end
    }
}
