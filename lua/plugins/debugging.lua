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
        vim.keymap.set('n', '<F7>', dap.step_into, {})
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
                args = {'--max-polymer-atoms=200', '--max-polymer-span=2', '/home/jaro/projects/cif/9/00/89/9008997.cif'}
                --args = {'test_stoichiometry.cif'}
                --args = {'check_stoichiometry_multiple.cif'}
                --args = {'/home/jaro/projects/cif/1/00/00/1000063.cif'}
                --args = {'testcase10.cif'}
                --args = {'--max-polymer-atoms=200', '--max-polymer-span=1', '-i', '--p1', '--merge-disorder-groups', '/home/jaro/projects/cif/1/52/23/1522303.cif'}
                --args = {'testpolymer.cif'}
                --args = { 'tests/cases/cif_polymer_multiplicity_012.inp'}
                --args = {'test89.cif'}
				--args = { '--multiplicity-file outputs/polymers/default/7/20/71/7207129_multiplicity.txt', 'outputs/polymers/default/7/20/71/7207129.cif'}
				--args = {'1001629test.cif'}
				--args = {'7006462test.cif'}
				--args = {'7223179test.cif'}
				--args = {'7203068test.cif'}
				--args = {'4506164test.cif'}
				--args = {'outputs/polymers/summary.txt'}
				--args = {'--molecule-id=9008834_molecule_0','outputs/polymers/default/9/00/88/9008834.cgd'}
                --args = {'--revision=12300', '--summary-file=outputs/polymers/summary.txt', '--polymer-list-file=outputs/polymers/analysis/basic/summary2molecule-table.out', '--cif-folder=outputs/polymers/default/'}
                --args = { 'outputs/polymers/default/9/00/88/9008834_systre.out'}
                --args = {'outputs/polymers/analysis/basic/summary2molecule-table.out'}
                --args = {'--max-polymer-atoms=200', '--max-polymer-span=1', '-i', '--p1', '--merge-disorder-groups', '/home/jaro/projects/cif/1/01/13/1011329.cif'}
                --args = {'--max-polymer-atoms=200', '--max-polymer-span=1', '-i', '--p1', '--merge-disorder-groups', '/home/jaro/projects/cif/9/00/88/9008834.cif'}
            }
        }
        dap.set_log_level 'DEBUG'
    end
}
