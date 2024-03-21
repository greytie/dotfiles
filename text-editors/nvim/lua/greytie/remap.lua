vim.g.mapleader = " "
-- Disabled due to netrw being disabled
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>")
vim.keymap.set("n", "<leader>pv", ":NvimTreeTogsgle<CR>")
