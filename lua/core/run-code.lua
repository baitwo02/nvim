local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

local run_code = function ()
    local filetype = vim.api.nvim_eval('&filetype')
    vim.cmd[[ w ]]
    if filetype == "c" then
        vim.cmd[[ set splitright ]]
        vim.cmd[[ vsplit ]]
        vim.cmd[[ term gcc -g % -o %< && time ./%< ]]
    elseif filetype == "lua" then
        vim.cmd[[ set splitright ]]
        vim.cmd[[ vsplit ]]
        vim.cmd[[ term time lua % ]]
    elseif filetype == "python" then
        vim.cmd[[ set splitright ]]
        vim.cmd[[ vsplit ]]
        vim.cmd[[ term time python % ]]
    end
end

keymap("n", "r", run_code, opts)

