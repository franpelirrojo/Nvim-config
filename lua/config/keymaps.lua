vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) --Proyect view

--Mover bloques en modo visual con autoindent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--Mantiene el cursos al principio al usar J.
vim.keymap.set("n", "J", "mzJ`z")
--Manatine el cursor en el medio usando el salto de media página
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
--Mantiene el cursos en el medio al buscar en Vim
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--Separar los portapapeles de nvim y del sistema
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
--Borrar sin guardar en el buffer
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")
--Pegar sin sobreescribir el buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

--Sustituye la palabra sobre la que estabas en todo el docuemento
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
