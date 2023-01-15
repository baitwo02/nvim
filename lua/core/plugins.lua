local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- 防止第一次使用时报错
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

local plugins = {
	{
		"nvim-lua/plenary.nvim", -- 很多插件都能用到
		lazy = false,
	},
	{
		-- 美化
		"nvim-treesitter/nvim-treesitter", -- 语法高亮
		"lukas-reineke/indent-blankline.nvim", -- 缩进
		lazy = false,
        priority = 1000,
	},
    {
        -- tree
        "nvim-tree/nvim-tree.lua", -- 文件树插件
        "nvim-tree/nvim-web-devicons", -- 为文件树提供 icons
        lazy = false,
        priority = 999,
    },
	{
		-- Cmp 补全
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer", -- Cmp 补全缓冲区
		"hrsh7th/cmp-path", -- Cmp 补全路径
		"hrsh7th/cmp-cmdline", -- Cmp 补全命令行
		"hrsh7th/cmp-nvim-lsp", -- Cmp 使用 lsp 补全
		lazy = false,
		priority = 1001,
	},
	{
		-- lsp 补全
		"neovim/nvim-lspconfig", -- 让 neovim 支持 lsp 配置
		"williamboman/mason.nvim", -- 使用 mason 简单安装 lsp serveer
		"williamboman/mason-lspconfig.nvim", -- 简单配置 lsp
		"jose-elias-alvarez/null-ls.nvim", -- 格式化及语法检查
		lazy = false,
	},
	{
		-- 代码调试
		"mfussenegger/nvim-dap", -- nvim-dap 支持调试功能
		"jayp0521/mason-nvim-dap.nvim", -- 使 dap 配置变简单
		"rcarriga/nvim-dap-ui", -- dap ui 界面
		"theHamsta/nvim-dap-virtual-text", -- 虚拟文字, 能在 buffer 显示变量值
        "Weissle/persistent-breakpoints.nvim", -- 记录断点信息
		lazy = true,
		ft = { "c", "python", "rust", "go" },
	},
	{
		-- snippet 补全
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		lazy = false,
	},
}

local user_plugins = require("user.plugins")

for _, v in pairs(user_plugins) do
	plugins[#plugins+1]= v
end

lazy.setup(plugins)
