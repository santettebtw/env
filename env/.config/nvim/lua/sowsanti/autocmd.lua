local sowgroup = vim.api.nvim_create_augroup("sowsanti", { clear = true })

-- quit help buffers files with q
-- vim.api.nvim_create_autocmd({'OptionSet'}, {
--   pattern = "buftype=help",
vim.api.nvim_create_autocmd({ 'FileType' }, {
  group = sowgroup,
  pattern = { "help", "git" }, -- NOTE(sss): git for closing Trouble quickly
  callback = function()
    vim.keymap.set('n', 'q', ':q<cr>', { buffer = true, silent = true })
  end
})
