vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/muniftanjim/nui.nvim" },
    { src = "https://github.com/echasnovski/mini.pick" }, -- for file_selector provider mini.pick
    { src = "https://github.com/nvim-telescope/telescope.nvim" }, -- for file_selector provider telescope
    { src = "https://github.com/hrsh7th/nvim-cmp" }, -- autocompletion for avante commands and mentions
    { src = "https://github.com/ibhagwan/fzf-lua" }, -- for file_selector provider fzf
    { src = "https://github.com/stevearc/dressing.nvim" }, -- for input provider dressing
    { src = "https://github.com/folke/snacks.nvim" }, -- for input provider snacks
    { src = "https://github.com/nvim-tree/nvim-web-devicons" }, -- or echasnovski/mini.icons
    { src = "https://github.com/zbirenbaum/copilot.lua" } -- for providers='copilot'
})

vim.pack.add({{src = "https://github.com/yetone/avante.nvim"}})
require('avante').setup({
    -- add any opts here
    -- this file can contain specific instructions for your project
    instructions_file = "avante.md",
    -- for example
    provider = "claude",
    providers = {
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-sonnet-4-20250514",
        timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 20480,
          },
      },
	}
})
