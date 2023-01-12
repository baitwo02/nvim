local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
local dap = require("dap")


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

vim.cmd([[au FileType dap-repl lua require('dap.ext.autocompl').attach()]])

keymap("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>", opts)
keymap("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", opts)
keymap("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", opts)
keymap("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>", opts)
keymap("n", "<Leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<Leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap("n", "<Leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>", opts)
keymap("n", "<Leader>dl", "<Cmd>lua require'dap'.run_last()<CR>", opts)
keymap(
	"n",
	"<Leader>lp",
	"<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
	opts
)

-- dap.defaults.fallback.terminal_win_cmd = "tabnew"
dap.defaults.fallback.auto_continue_if_many_stopped = false

-- dap.defaults.fallback.force_external_terminal = true
dap.defaults.fallback.terminal_win_cmd = "50vsplit new"
dap.defaults.fallback.focus_terminal = true

dap.defaults.fallback.external_terminal = {
	command = "/usr/bin/kitty",
	args = { "-e" },
}

dap.defaults.python.terminal_win_cmd = "belowright new"
