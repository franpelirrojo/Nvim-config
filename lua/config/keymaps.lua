vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) --Proyect view

--Mover bloques en modo visual
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

--Mantiene el cursos al principio al usar J.
--Mnatine el cursor en el medio usando RepagyAvpag
--Mantiene el cursos en el medio al buscar en Vim
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
--
--Borrar sin guardar en el buffer
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

--Sobreescribe sin sobreescribir el buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

--Sustituye la palabra sobre la que estabas en todo el docuemento (rename)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
