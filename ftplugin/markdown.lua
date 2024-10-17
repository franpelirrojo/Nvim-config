-- Primero marcamos en el buffer (bo, buffer options) que las lineas no pueden
-- más de 80 caracteres. Segundo añadimos la flag t a las opciones de formateado
-- para que se aplique la ruptura de linea. Despues configuramos la ruptura de
-- linea para que no rompa la legibilidad del texto en la ventana (wo, window options).
vim.bo.textwidth = 80
vim.bo.formatoptions = vim.bo.formatoptions .. "t"
vim.wo.wrap = true
vim.wo.linebreak = true

-- Aplica el formato a a todo el documento antes de escribir el buffer, evitando las tablas
vim.cmd([[
  augroup format_on_save
    autocmd!
    autocmd BufWritePre *.md lua FormatMarkdown()
  augroup end
]])

function FormatMarkdown()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

    for line_num, line in ipairs(lines) do
        -- Verifica si la línea tiene más de 80 caracteres y no contiene el
        -- patrón de las tablas de markdown.
        if #line > 80 and not line:match("|%s*([^|]+)%s*|") then
            -- Aplica el formateo a la línea
            vim.cmd.normal({ line_num .. "gqq", bang = true })
        end
    end

    -- Restaura la posición del cursor
    vim.api.nvim_win_set_cursor(0, cursor_pos)
end
