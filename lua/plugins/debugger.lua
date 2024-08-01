return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap = require("dap")

        -- C#
        dap.adapters.coreclr = {
            type = 'executable',
            command = vim.fn.stdpath('data') .. '/mason/bin/netcoredbg',
            args = { '--interpreter=vscode' }
        }
        dap.configurations.cs = {
            {
                type = "coreclr",
                name = "launch - netcoredbg",
                request = "launch",
                program = function() -- Ask the user what executable wants to debug
                    return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Program.exe', 'file')
                end,
            },
        }

        -- F#
        dap.configurations.fsharp = dap.configurations.cs

        -- Lua
        dap.adapters.nlua = function(callback, config)
            callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
        end
        dap.configurations.lua = {
            {
                type = 'nlua',
                request = 'attach',
                name = "Attach to running Neovim instance",
                program = function() pcall(require "osv".launch({ port = 8086 })) end,
            }
        }

        -- C
        dap.adapters.codelldb = {
            type = 'server',
            port = "${port}",
            executable = {
                command = vim.fn.stdpath('data') .. '/mason/bin/codelldb',
                args = { "--port", "${port}" },
                detached = function() if is_windows then return false else return true end end,
            }
        }
        dap.configurations.c = {
            {
                name = 'Launch',
                type = 'codelldb',
                request = 'launch',
                program = function() -- Ask the user what executable wants to debug
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/bin/program', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = {},
            },
        }

        -- C++
        dap.configurations.cpp = dap.configurations.c

        -- Rust
        dap.configurations.rust = {
            {
                name = 'Launch',
                type = 'codelldb',
                request = 'launch',
                program = function() -- Ask the user what executable wants to debug
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/bin/program', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = {},
                initCommands = function() -- add rust types support (optional)
                    -- Find out where to look for the pretty printer Python module
                    local rustc_sysroot = vim.fn.trim(vim.fn.system('rustc --print sysroot'))

                    local script_import = 'command script import "' ..
                    rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
                    local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'

                    local commands = {}
                    local file = io.open(commands_file, 'r')
                    if file then
                        for line in file:lines() do
                            table.insert(commands, line)
                        end
                        file:close()
                    end
                    table.insert(commands, 1, script_import)

                    return commands
                end,
            }
        }

        -- Javascript / Typescript (firefox)
        dap.adapters.firefox = {
            type = 'executable',
            command = vim.fn.stdpath('data') .. '/mason/bin/firefox-debug-adapter',
        }
        dap.configurations.typescript = {
            {
                name = 'Debug with Firefox',
                type = 'firefox',
                request = 'launch',
                reAttach = true,
                url = 'http://localhost:4200', -- Write the actual URL of your project.
                webRoot = '${workspaceFolder}',
                firefoxExecutable = '/usr/bin/firefox'
            }
        }
        dap.configurations.javascript = dap.configurations.typescript
        dap.configurations.javascriptreact = dap.configurations.typescript
        dap.configurations.typescriptreact = dap.configurations.typescript

        local dapui = require("dapui")
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        vim.keymap.set('n', '<F5>', function() dap.continue() end)
        vim.keymap.set('n', '<F10>', function() dap.step_over() end)
        vim.keymap.set('n', '<F11>', function() dap.step_into() end)
        vim.keymap.set('n', '<F12>', function() dap.step_out() end)
        vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
        vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end)
        vim.keymap.set('n', '<Leader>lp',
            function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
        vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
        vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)
    end
}
