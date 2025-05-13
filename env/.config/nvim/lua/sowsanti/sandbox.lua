vim.cmd.colorscheme("lushgrapemax-dark")
-- vim.cmd.colorscheme("habamax")
-- vim.cmd.colorscheme("desert")
vim.g.colortemplate_toolbar = 0

-- vim.lsp.config['luals'] = {
--   cmd = { 'lua-language-server' },
--   filetypes = { 'lua' },
--   root_markers = { '.luarc.json', '.luarc.jsonc' },
--   -- Specific settings to send to the server. The schema for this is
--   -- defined by the server. For example the schema for lua-language-server
--   -- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
--   settings = {
--     Lua = {
--       runtime = {
--         version = 'LuaJIT',
--       },
--       workspace = {
--         checkThirdParty = false,
--         library = {
--           vim.env.VIMRUNTIME
--         }
--       }
--     }
--   }
-- }

-- vim.lsp.config['bashls'] = {
--   cmd = {'bash-language-server', 'start'},
--   filetypes = { 'sh', 'bash' },
-- }

-- vim.lsp.config['tinymist'] = {
--   cmd = {'tinymist', 'lsp'},
--   filetypes = { 'typst' },
-- }

-- vim.lsp.config['pyright'] = {
--   cmd = { "pyright-langserver", "--stdio" },
--   filetypes = { 'python' },
--   root_markers = {
--     'requirements.txt',
--     '.git'
--   },
--   settings = {
--     python = {
--       analysis = {
--         autoSearchPaths = true,
--         diagnosticMode = "workspace",
--         useLibraryCodeForTypes = true
--       }
--     }
--   }
-- }

-- vim.lsp.config('*', {
--   capabilities = {
--     textDocument = {
--       semanticTokens = {
--         multilineTokenSupport = true,
--       }
--     }
--   },
--   root_markers = { '.git' },
-- })

-- vim.lsp.enable('luals')
-- vim.lsp.enable('clangd')
-- -- vim.lsp.enable('bash')
-- vim.lsp.enable('tinymist')
-- vim.lsp.enable('pyright')
-- vim.lsp.enable('gopls')

-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('my.lsp', {}),
--   callback = function(args)
--     local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
--     if client:supports_method('textDocument/implementation') then
--       -- Create a keymap for vim.lsp.buf.implementation ...
--     end

--     -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
--     if client:supports_method('textDocument/completion') then
--       -- Optional: trigger autocompletion on EVERY keypress. May be slow!
--       -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
--       -- client.server_capabilities.completionProvider.triggerCharacters = chars

--       vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
--       vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--     end

--     -- Auto-format ("lint") on save.
--     -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
--     -- if not client:supports_method('textDocument/willSaveWaitUntil')
--     --   and client:supports_method('textDocument/formatting') then
--     --   vim.api.nvim_create_autocmd('BufWritePre', {
--     --     group = vim.api.nvim_create_augroup('my.lsp', {clear=false}),
--     --     buffer = args.buf,
--     --     callback = function()
--     --       vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
--     --     end,
--     --   })
--     -- end
--   end,
-- })

--- NOTE(sss): nothing to do with LSP, just diagnostics.
---             -> diagnostics are not directly related to LSP.
-- vim.diagnostic.config({ virtual_text = true, virtual_lines = false, update_in_insert = true })
vim.keymap.set('n', '<space>lv', function()
  if vim.diagnostic.config().virtual_lines then
    vim.diagnostic.config({ virtual_text = true, virtual_lines = false, update_in_insert = true })
    vim.notify("disabled virtual lines", vim.log.levels.INFO)
  else
    vim.diagnostic.config({ virtual_text = false, virtual_lines = true, update_in_insert = true, severity_sort=true })
    vim.notify("enabled virtual lines", vim.log.levels.INFO)
  end
end)

-- example diagnostic creation, LSP agnostic
-- local test_diagnostic = {
  --         bufnr = 2,
  --         lnum = 59, end_lnum = 59,
  --         col = 0, end_col = 36,
  --         severity = vim.diagnostic.severity.INFO,
  --         message = "this is just a test very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very long"
  --       }
  -- vim.diagnostic.set(1, 2, {test_diagnostic})

  -- local function build_quickfix_list(lines)
    --   local qf_entries = {}
    --   for _, line in ipairs(lines) do
    --     table.insert(qf_entries, { filename = line, lnum = 1 })
    --   end
    --   vim.fn.setqflist(qf_entries)
    --   vim.cmd('copen')
    --   vim.cmd('cc')
    -- end
    --
    -- -- Set up the FZF actions
    -- vim.g.fzf_action = {
      --   ['ctrl-q'] = build_quickfix_list, -- TODO(sss): add matched entries rather than selected ones
      --   ['ctrl-t'] = 'tab split',
      --   ['ctrl-x'] = 'split',
      --   ['ctrl-v'] = 'vsplit'
      -- }
      -- vim.keymap.set("n", "<leader>pf", '<cmd>FZF<CR>')
      -- vim.keymap.set('n', '<leader>ps', function()
        --   vim.fn['fzf#run']({
          --     source = 'rg --column --line-number --no-heading --smart-case ""',
          --     sink = function(selected)
            --       -- Extract file path and line number
            --       local file, line = selected:match("^([^:]+):(%d+)")
            --       if file then
            --         vim.cmd(string.format('e +%s %s', line, vim.fn.fnameescape(file)))
            --       end
            --     end,
            --     options = '--delimiter : --preview "bat --color=always --line-range {2}: {1}"',
            --     window = { width = 0.9, height = 0.6 }
            --   })
            -- end)
