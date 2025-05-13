vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set("n", "<leader>x", ":.lua<cr>")
vim.keymap.set("v", "<leader>x", ":lua<cr>")

vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "<leader>y", "\"+y")

vim.keymap.set("n", "]t", vim.cmd.tabnext)
vim.keymap.set("n", "[t", vim.cmd.tabprevious)
vim.keymap.set("n", "<leader>tn", vim.cmd.tabnew)
