-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ccrust-via-lldb-vscode
return {
    -- adapters = {
    --     codelldb = {
    --     type = 'server',
    --     port = "${port}",
    --     executable = {
    --         command = vim.env.HOME .. '/.local/share/nvim/dapinstall/codelldb/extension/adapter/codelldb',
    --         args = { "--port", "${port}" },
    --         -- On windows you may have to uncomment this:
    --         -- detached = false,
    --     },
    --     },
    -- },
    -- adapters = {
    --     codelldb = function(on_adapter)
    --         local stdout = vim.loop.new_pipe(false)
    --         local stderr = vim.loop.new_pipe(false)
    --         local cmd = vim.env.HOME .. '/.local/share/nvim/dapinstall/codelldb/extension/adapter/codelldb'
    --         local handle, pid_or_err
    --         local opts = {
    --             stdio = { nil, stdout, stderr },
    --             detached = true,
    --         }
    --         handle, pid_or_err = vim.loop.spawn(cmd, opts, function(code)
    --             stdout:close()
    --             stderr:close()
    --             handle:close()
    --             if code ~= 0 then
    --                 print("codelldb exited with code", code)
    --             end
    --         end)
    --         assert(handle, "Error running codelldb: " .. tostring(pid_or_err))
    --         stdout:read_start(function(err, chunk)
    --             assert(not err, err)
    --             if chunk then
    --                 local port = chunk:match('Listening on port (%d+)')
    --                 if port then
    --                     vim.schedule(function()
    --                         on_adapter({
    --                             type = 'server',
    --                             host = '127.0.0.1',
    --                             port = port
    --                         })
    --                     end)
    --                 else
    --                     vim.schedule(function()
    --                         require("dap.repl").append(chunk)
    --                     end)
    --                 end
    --             end
    --         end)
    --         stderr:read_start(function(err, chunk)
    --             assert(not err, err)
    --             if chunk then
    --                 vim.schedule(function()
    --                     require("dap.repl").append(chunk)
    --                 end)
    --             end
    --         end)
    --     end
    -- },
    configurations = {
        {
            name = "Launch file",
            type = "codelldb",
            request = "launch",
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = true,
        },
    }
}
