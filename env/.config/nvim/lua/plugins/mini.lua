vim.pack.add({
	{src = 'https://github.com/nvim-mini/mini.pick'}
})

require('mini.pick').setup()
vim.keymap.set('n', '<leader>sf', MiniPick.builtin.files)
vim.keymap.set('n', '<leader>sg', MiniPick.builtin.grep_live)
vim.keymap.set('n', '<leader>sh', MiniPick.builtin.help)
vim.keymap.set('n', '<leader>sr', MiniPick.builtin.resume)
