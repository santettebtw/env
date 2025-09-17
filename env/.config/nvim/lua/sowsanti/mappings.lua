local opts = { silent = true }

vim.keymap.set('n', '<leader>pf', ':Ex<cr>', opts) 		-- file explorer

vim.keymap.set('n', '<leader>x', ':so %<cr>', opts)		-- source current file
vim.keymap.set('n', '<leader><leader>x', ':.so<cr>', opts)	-- source current line
vim.keymap.set('v', '<leader>x', ':so<cr>', opts)		-- source highlighted

vim.keymap.set('n', '<esc>', ':nohlsearch<cr>', opts)		-- clear search highlights
