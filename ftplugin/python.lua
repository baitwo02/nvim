-- :help options
local options = {
	-- 缩进
	showtabline = 2, -- 总是显示 tabs
	smartindent = true, -- 让缩进更智能
	expandtab = true, -- 将 tab 转换为空格
	shiftwidth = 4, -- 每次缩进所插入的空格数量
	tabstop = 4, -- 一个 tab 键插入空格数量
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
