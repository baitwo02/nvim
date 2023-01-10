local dap = require("dap")

-- 注册 adapter
dap.adapters.python = {
	type = "executable",
	command = os.getenv("HOME") .. "/.virtualenvs/tools/bin/python",
	args = { "-m", "debugpy.adapter" },
}

-- 配置 adapter
dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		pythonPath = function()
			return "/usr/bin/python"
		end,
	},
}

vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
