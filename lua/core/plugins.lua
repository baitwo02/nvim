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
    -- 通用依赖
    "nvim-lua/plenary.nvim", -- 很多插件都能用到
    "nvim-tree/nvim-web-devicons", -- 提供 icons
    lazy = false,
  },
  {
    -- 语法亮
    "nvim-treesitter/nvim-treesitter", -- 高亮
    build = ":TSUpdate",
    "p00f/nvim-ts-rainbow", -- 彩虹括号
    lazy = false,
    priority = 1000,
  },
  {
    -- 美化
    "lukas-reineke/indent-blankline.nvim", -- 缩进
    lazy = false,
    priority = 1000,
  },
  {
    -- tree
    "nvim-tree/nvim-tree.lua", -- 文件树插件
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
    "windwp/nvim-autopairs", -- 自动配对括号
    lazy = false,
    priority = 1001,
  },
  {
    -- snippet 补全
    "SirVer/ultisnips",
    "quangnguyen30192/cmp-nvim-ultisnips",
    lazy = false,
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
    -- 搜索
    "nvim-telescope/telescope.nvim", -- 弹出窗口搜索
    "BurntSushi/ripgrep", -- 提供 find_files, live_grep and grep_string 支持
    "sharkdp/fd",
  },
  {
    -- 搜索的插件
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    dependencies = { "nvim-telescope/telescope.nvim", },
    lazy = false,
  },
}

local user_plugins = require("user.plugins")

for _, v in pairs(user_plugins) do
  plugins[#plugins + 1] = v
end

lazy.setup(plugins)


