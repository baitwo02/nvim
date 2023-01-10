local M = {}

local function config_signs()
    local dap_signs = {
        DapBreakpoint = {
            text = "🔴",
            texthl = "",
            linehl = "",
            numhl = "",
        },
        DapBreakpointRejected = {
            text = "",
            texthl = "LspDiagnosticsSignHint",
            linehl = "",
            numhl = "",
        },
        DapStopped = {
            text = "➜ ",
            texthl = "LspDiagnosticsSignInformation",
            linehl = "DiagnosticUnderlineInfo",
            numhl = "LspDiagnosticsSignInformation",
        },
    }
    for name, val in pairs(dap_signs) do
        vim.fn.sign_define(name, val)
    end
end

local function config_event()
    local dap, dapui = require("dap"), require("dapui")

    local debug_open = function()
        require("nvim-tree.view").close()
        dapui.open({})
    end
    local debug_close = function()
        dap.repl.close()
        dapui.close({})
    end

    dap.listeners.after.event_initialized["dapui_config"] = debug_open
    dap.listeners.before.event_terminated["dapui_config"] = debug_close
    dap.listeners.before.event_exited["dapui_config"] = debug_close
    dap.listeners.before.disconnect["dapui_config"] = debug_close
end

local function config_adapter()
    local mason_dap = require("mason-nvim-dap")
    mason_dap.setup({ automatic_setup = true })
    mason_dap.setup_handlers({
        function(source_name)
            require("mason-nvim-dap.automatic_setup")(source_name)
        end,
    })
    -- 让任务名和默认的相同就可以覆盖掉
    -- 从.vscode/launch.json读取dap配置
    -- 也可以用DapLoadLanunchJSON命令
    require("dap.ext.vscode").load_launchjs(
        nil,
        -- dap type -> filetype
        { python = { "python" } }
    )
end

local function config_breakpoints()
    require("persistent-breakpoints").setup({
        -- save_dir = vim.fn.stdpath("data") .. "/nvim_checkpoints",
        load_breakpoints_event = { "BufReadPost" },
        -- record the performance of different function. run :lua require('persistent-breakpoints.api').print_perf_data() to see the result.
        perf_record = false,
    })
    local api = require("persistent-breakpoints.api")
    vim.api.nvim_create_user_command("PBToggleBreakpoint", api.toggle_breakpoint, {})
    vim.api.nvim_create_user_command(
        "PBSetConditionalBreakpoint",
        api.set_conditional_breakpoint,
        {}
    )
    vim.api.nvim_create_user_command("PBClearBreakpoint", api.clear_all_breakpoints, {})
end

function M.setup()
    -- global settings
    config_signs()
    config_event()
    config_adapter()
    config_breakpoints()
end

return M
