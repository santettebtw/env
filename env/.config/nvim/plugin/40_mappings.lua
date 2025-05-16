local MiniPick = require("mini.pick")

vim.keymap.set('n', '<leader>pf', MiniPick.builtin.files)
vim.keymap.set('n', '<leader>sg', MiniPick.builtin.grep_live)
