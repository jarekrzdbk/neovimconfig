return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text"
    },
    config = function ()
        vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })
        local dap, dapui = require("dap"), require("dapui")
        dapui.setup()

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
        vim.keymap.set('n', '<F5>', dap.continue, {})
        vim.keymap.set('n', '<F8>', dap.step_over, {})
        vim.keymap.set('n', '<F11>', dap.step_into, {})
        vim.keymap.set('n', '<F12>', dap.step_out, {})
        vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint, {})

        dap.adapters.perl = {
            type = 'executable',
            command = 'bash',
            args = {'/home/jaro/.local/bin/start_language_server.sh'}
        }
        dap.configurations.perl = {
            {
                type = 'perl',
                name = 'Debug',
                request = 'launch',
                showLog = true,
                program = "${file}",
                stopOnEntry = true,
                reloadModules = true,
                args = {'--max-polymer-atoms=200', '--max-polymer-span=1', '/home/jaro/projects/cif/9/00/89/9008997.cif'}
            }
        }
        dap.set_log_level 'DEBUG'
    end
}
