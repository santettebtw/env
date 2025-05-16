-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
    vim.cmd('echo "Installing `mini.nvim`" | redraw')
    local clone_cmd = {
        'git', 'clone', '--filter=blob:none',
        'https://github.com/echasnovski/mini.nvim', mini_path
    }
    vim.fn.system(clone_cmd)
    vim.cmd('packadd mini.nvim | helptags ALL')
    vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

require('mini.deps').setup()

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Safely execute immediately
now(function() vim.cmd('colorscheme lushgrapemax-dark') end)
now(function() require('mini.statusline').setup() end)

-- Safely execute later
later(function() require('mini.pick').setup() end)
later(function() require('mini.extra').setup() end)

later(function()
    local hipatterns = require('mini.hipatterns')
    hipatterns.setup({
        highlighters = {
            hex_color = hipatterns.gen_highlighter.hex_color(),
            fixme     = { pattern = 'FIXME', group = 'MiniHipatternsFixme' },
            hack      = { pattern = 'HACK', group = 'MiniHipatternsHack' },
            todo      = { pattern = 'TODO', group = 'MiniHipatternsTodo' },
            note      = { pattern = 'NOTE', group = 'MiniHipatternsNote' },
        }
    })
end)

later(function() require('mini.icons').setup() end)

later(function()
    require('mini.tabline').setup({
        show_icons = true,
    })
end)

-- Language server and diagnostics configurations =============================
later(function()
    -- Enable LSP only on Neovim>=0.11 as it introduced `vim.lsp.config`
    if vim.fn.has('nvim-0.11') == 0 then return end

    add('neovim/nvim-lspconfig')

    -- All language servers are expected to be installed with 'mason.vnim'
    vim.lsp.enable({
        'clangd',
        'emmet_ls',
        'gopls',
        'intelephense',
        'lua_ls',
        'pyright',
        'r_language_server',
        'rust_analyzer',
        'ts_ls',
    })
end)

vim.diagnostic.config({
    jump = { float = true },
    signs = false
})

-- Harpoon ====================================================================
later(function()
    add({ source = 'ThePrimeagen/harpoon', depends = {'nvim-lua/plenary.nvim'}})
    require('harpoon').setup()
    vim.keymap.set('n', '<M-a>', require('harpoon.mark').add_file)
    vim.keymap.set('n', '<M-e>', require('harpoon.ui').toggle_quick_menu)
    vim.keymap.set('n', '<M-h>', function() require('harpoon.ui').nav_file(1) end)
    vim.keymap.set('n', '<M-j>', function() require('harpoon.ui').nav_file(2) end)
    vim.keymap.set('n', '<M-k>', function() require('harpoon.ui').nav_file(3) end)
    vim.keymap.set('n', '<M-l>', function() require('harpoon.ui').nav_file(4) end)
end)

-- Git ========================================================================
later(function()
    require('mini.diff').setup({
        view = {
            style = 'sign',
            signs = { add = '▒', change = '▒', delete = '▒' },
            priority = 9999
        }
    })
    -- require('mini.git').setup() -- idk man
    add('tpope/vim-fugitive')
end)

-- Personal plugins ===========================================================
later(function() require("linenrdiagnostics").setup() end)

-- Sandbox  ===================================================================
require('vim._extui').enable({})
later(function()
    add("rktjmp/lush.nvim")
    add("rktjmp/shipwright.nvim")
    vim.opt.runtimepath:append(vim.fn.stdpath('config') .. '/lushgrapemax')
end)
