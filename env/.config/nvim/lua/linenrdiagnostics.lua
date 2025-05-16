local M = {}

local ns_id = vim.api.nvim_create_namespace("LineNrDiagnostics")

function M.update_diagnostics(bufnr)
    vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)
    local diagnostics = vim.diagnostic.get(bufnr)

    for _, diagnostic in ipairs(diagnostics) do
        local line = diagnostic.lnum
        local severity = diagnostic.severity

        local hl_group = ({
            [vim.diagnostic.severity.ERROR] = "LineNrDiagnosticsError",
            [vim.diagnostic.severity.WARN] = "LineNrDiagnosticsWarn",
            [vim.diagnostic.severity.INFO] = "LineNrDiagnosticsInfo",
            [vim.diagnostic.severity.HINT] = "LineNrDiagnosticsHint",
        })[severity]

        vim.api.nvim_buf_set_extmark(bufnr, ns_id, line, 0, {
            hl_group = hl_group,
            hl_mode = "combine",
            priority = 100,
            number_hl_group = hl_group,
        })
    end
end

function M.setup()
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "DiagnosticChanged" }, {
        callback = function(args)
            M.update_diagnostics(args.buf)
        end,
    })
end

return M
