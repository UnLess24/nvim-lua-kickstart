-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
    -- NOTE: Yes, you can install new plugins here!
    'mfussenegger/nvim-dap',
    -- NOTE: And you can specify dependencies as well
    dependencies = {
        -- Creates a beautiful debugger UI
        'rcarriga/nvim-dap-ui',

        -- Installs the debug adapters for you
        'williamboman/mason.nvim',
        'jay-babu/mason-nvim-dap.nvim',

        -- Add your own debuggers here
        'leoluz/nvim-dap-go',
    },
    -- require('php_dap_adapter'),
    config = function()
        local dap = require 'dap'
        local dapui = require 'dapui'

        require('mason-nvim-dap').setup {
            -- Makes a best effort to setup the various debuggers with
            -- reasonable debug configurations
            automatic_setup = true,

            -- You can provide additional configuration to the handlers,
            -- see mason-nvim-dap README for more information
            handlers = {},

            -- You'll need to check that you have the required things installed
            -- online, please don't ask me how to install them :)
            ensure_installed = {
                -- Update this to ensure that you have the debuggers for the langs you want
                'delve',
            },
        }

        -- Basic debugging keymaps, feel free to change to your liking!
        --
        vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
        vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
        vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
        vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
        vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
        vim.keymap.set('n', '<leader>B', function()
            dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end, { desc = 'Debug: Set Breakpoint' })

        -- Setup debug adapter and configurations
        -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#php
        --
        local homePath = os.getenv('HOME')
        -- PHP debugging
        dap.adapters.php = {
            type = 'executable',
            command = 'node',
            args = { homePath .. '/.local/share/nvim/vscode-php-debug/out/phpDebug.js' }
        }
        dap.configurations.php = {
            {
                type = 'php',
                request = 'launch',
                name = 'Listen for Xdebug',
                port = 9003,
                hostname = 'crpt.my',
                log = true,
                serverSourceRoot = '/code',
                localSourceRoot = homePath .. '/Platform/code/'
            }
        }

        -- Golang debugging
        dap.adapters.go = {
            type = 'executable',
            command = 'node',
            args = { homePath .. '/vscode-go/dist/debugAdapter.js' },
        }
        dap.configurations.go = {
            {
                type = 'go',
                name = 'Debug',
                request = 'launch',
                showLog = false,
                program = "${file}",
                dlvToolPath = vim.fn.exepath('dlv') -- Adjust to where delve is installed
            },
        }

        -- Breakpoint colors
        --
        local namespace = vim.api.nvim_create_namespace("dap-hlng")
        vim.api.nvim_set_hl(namespace, 'DapBreakpoint', { fg = '#993939', bg = '#ffffff' })
        vim.api.nvim_set_hl(namespace, 'DapLogPoint', { fg = '#61afef', bg = '#ffffff' })
        vim.api.nvim_set_hl(namespace, 'DapStopped', { fg = '#993939', bg = '#ffffff' })

        -- Install patched fonts and use Hack Nerd Font Mono
        -- brew tap homebrew/cask-fonts
        -- brew install font-hack-nerd-font
        --
        -- vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
        vim.fn.sign_define('DapBreakpoint',
            { text = '•', texthl = 'DapBreakpoint', linehl = '', numhl = 'DapBreakpoint' })
        vim.fn.sign_define('DapBreakpointCondition',
            { text = '…', texthl = 'DapBreakpoint', linehl = '', numhl = 'DapBreakpoint' })
        vim.fn.sign_define('DapBreakpointRejected',
            { text = '', texthl = 'DapBreakpoint', linehl = '', numhl = 'DapBreakpoint' })
        vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapLogPoint', linehl = '', numhl = 'DapLogPoint' })
        vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = '', numhl = 'DapStopped' })

        -- Dap UI setup
        -- For more information, see |:help nvim-dap-ui|
        dapui.setup {
            -- Set icons to characters that are more likely to work in every terminal.
            --    Feel free to remove or use ones that you like more! :)
            --    Don't feel like these are good choices.
            icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
            controls = {
                element = "repl",
                enabled = true,
                icons = {
                    disconnect = "",
                    pause = "",
                    play = "",
                    run_last = "",
                    step_back = "",
                    step_into = "",
                    step_out = "",
                    step_over = "",
                    terminate = ""
                },
            },
            element_mappings = {},
            expand_lines = true,
            floating = {
                border = "single",
                mappings = {
                    close = { "q", "<Esc>" }
                }
            },
            force_buffers = true,
            layouts = { {
                elements = { {
                    id = "scopes",
                    size = 0.65
                }, {
                    id = "breakpoints",
                    size = 0.1
                }, {
                    id = "stacks",
                    size = 0.2
                }, {
                    id = "watches",
                    size = 0.05
                } },
                position = "left",
                size = 60
            }, {
                elements = { {
                    id = "repl",
                    size = 0.5
                }, {
                    id = "console",
                    size = 0.5
                } },
                position = "bottom",
                size = 10
            } },
            mappings = {
                edit = "e",
                expand = { "<CR>", "<2-LeftMouse>" },
                open = "o",
                remove = "d",
                repl = "r",
                toggle = "t"
            },
            render = {
                indent = 1,
                max_value_lines = 100
            }
        }

        -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
        vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close

        -- Install golang specific config
        require('dap-go').setup()
    end,
}
