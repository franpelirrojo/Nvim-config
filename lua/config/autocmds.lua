-- Inicia JDTLS cuando el bufer es un archivo java
vim.cmd([[
    augroup jdtls_lsp
        autocmd!
        autocmd FileType java lua require'config.jdtls'.setup_jdtls()
    augroup end
]])

-- Hace parpadear el texto copiado para que no sea confuso
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Parpadea(subraya durante unos ms) el texto cuando se copia',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
