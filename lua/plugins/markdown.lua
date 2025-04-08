return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function()
        vim.g.mkdp_auto_close = 0
        vim.g.mkdp_browser = 'explorer.exe'

        vim.api.nvim_set_keymap('n', '<leader>mv', ':MarkdownPreview<cr>', { noremap = true, silent = true })
    end,
}
