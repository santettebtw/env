vim.pack.add({{ src="https://github.com/chomosuke/typst-preview.nvim" }})
require("typst-preview").setup({
	  open_cmd = 'qutebrowser %s',
})
