-- vim.cmd.colorscheme('desert')
-- vim.cmd.colorscheme('habamax')
-- vim.cmd.colorscheme('lunaperche')
vim.cmd.colorscheme('lushgrapemax-dark')

vim.g.mapleader		= ' '	-- space leader key

vim.g.netrw_banner 	= 0		-- remove netwr (explorer) banner

vim.o.rnu			= true 	-- show numbers
vim.o.nu			= true 	-- relative numbers
vim.o.undofile		= true 	-- persistent undo
vim.o.showmode		= false	-- don't show mode in cmdline
vim.o.cursorline	= true	-- highlight cursor line
vim.o.signcolumn	= 'yes'	-- enable sign column

vim.o.tabstop		= 4		-- number of spaces in for tab
vim.o.shiftwidth	= 4		-- number of spaces in for a 'shift' (< / >)

vim.o.ignorecase	= true
vim.o.smartcase		= true	-- smart case sensitive searches

-- popup menus height
vim.o.pumheight	= math.floor(vim.api.nvim_win_get_height(0) / 3) -- set max height of the popup menu
vim.api.nvim_create_autocmd('VimResized', {
	-- set max height of the popup menu when resizing
	callback = function(ev)
		vim.o.pumheight	= math.floor(vim.api.nvim_win_get_height(0) / 3)
	end
})
