require("persistent-breakpoints").setup({
	save_dir = vim.fn.stdpath("data") .. "/nvim_checkpoints",
	load_breakpoints_event = { "BufReadPost" },
	-- record the performance of different function. run :lua require('persistent-breakpoints.api').print_perf_data() to see the result.
	perf_record = false,
})
local api = require("persistent-breakpoints.api")
vim.api.nvim_create_user_command("PBToggleBreakpoint", api.toggle_breakpoint, {})
vim.api.nvim_create_user_command("PBSetConditionalBreakpoint", api.set_conditional_breakpoint, {})
vim.api.nvim_create_user_command("PBClearBreakpoint", api.clear_all_breakpoints, {})
