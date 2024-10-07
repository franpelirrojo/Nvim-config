return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    config = function()
        vim.g.mkdp_auto_close = 0
        vim.g.mkdp_browser = 'explorer.exe'

        vim.api.nvim_set_keymap('n', '<leader>mv', ':MarkdownPreviewToggle<CR>', { noremap = true, silent = true })
    end,
}
