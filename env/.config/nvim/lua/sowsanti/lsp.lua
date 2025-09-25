vim.lsp.enable('lua_ls')
vim.lsp.enable('clangd')
vim.lsp.enable('tinymist')
vim.lsp.enable('gopls')
vim.lsp.enable('jdtls')
vim.lsp.enable('kotlin_lsp')

--- @param diagnostic? vim.Diagnostic
--- @param bufnr integer
local function on_jump(diagnostic, bufnr)
	if not diagnostic then return end

	vim.diagnostic.open_float({bufnr = bufnr})
end

vim.diagnostic.config({ jump = { on_jump = on_jump } })

vim.keymap.set("n", "<leader>h", function()
  local params = { uri = vim.uri_from_bufnr(0) }
  vim.lsp.buf_request(0, "textDocument/switchSourceHeader", params, function(err, result)
    if err then
      vim.notify("SwitchSourceHeader failed: " .. err.message, vim.log.levels.ERROR)
      return
    end
    if not result then
      vim.notify("Corresponding file not found", vim.log.levels.WARN)
      return
    end
    vim.cmd("edit " .. vim.uri_to_fname(result))
  end)
end, { buffer = true, desc = "Switch between header and source" })

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'java',
	callback = function(args)
		require('jdtls.jdtls_setup').setup()
	end
})
