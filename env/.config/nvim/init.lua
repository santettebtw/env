require("sowsanti")

-- Function to source nvim-helper.lua if it exists in the current working directory
local function source_project_helper()
  local helper_path = vim.fn.getcwd() .. '/nvim-helper.lua'
  if vim.fn.filereadable(helper_path) == 1 then
    vim.cmd('luafile ' .. helper_path)
    print('Sourced nvim-helper.lua from ' .. helper_path)
  end
end

-- Source the helper file when Neovim starts
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    source_project_helper()
  end,
})

-- Optionally, source the helper file when changing directories
vim.api.nvim_create_autocmd('DirChanged', {
  callback = function()
    source_project_helper()
  end,
})
