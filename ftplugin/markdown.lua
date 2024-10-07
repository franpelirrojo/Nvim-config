-- Primero marcamos en el buffer (bo, buffer options) que las lineas no pueden
-- más de 80 caracteres. Segundo añadimos la flag t a las opciones de formateado
-- para que se aplique la ruptura de linea. Despues configuramos la ruptura de
-- linea para que no rompa la legibilidad del texto en la ventana (wo, window options).
vim.bo.textwidth = 80
vim.bo.formatoptions = vim.bo.formatoptions .. 't'
vim.wo.wrap = true
vim.wo.linebreak = true

-- Aplica el formato a a todo eld ocumento antes de escribir el buffer
vim.cmd([[
    augroup format_on_save
        autocmd!
        autocmd BufWritePre *.md lua vim.cmd('normal! gggqG')
    augroup end
]])
