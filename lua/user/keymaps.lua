local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- 取消一些按键的作用
keymap("", "<Space>", "<Nop>", opts)
keymap("", "s", "<Nop>", opts)
keymap("", "S", "<Nop>", opts)
keymap("", "r", "<Nop>", opts)
keymap("", "Q", "<Nop>", opts)
keymap("", "<cr>", "<Nop>", opts)

-- 将 space 键设置为 leader 键
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


---------- Normal ----------
-- 窗口导航
keymap("n", "<c-h>", "<c-w>h", opts)
keymap("n", "<c-j>", "<c-w>j", opts)
keymap("n", "<c-k>", "<c-w>k", opts)
keymap("n", "<c-l>", "<c-w>l", opts)
keymap("n", "<leader><c-h>", "<c-w>H", opts)
keymap("n", "<leader><c-J>", "<c-w>J", opts)
keymap("n", "<leader><c-K>", "<c-w>K", opts)
keymap("n", "<leader><c-L>", "<c-w>L", opts)

-- 分屏
keymap("n", "sh", ":set nosplitright<cr>:vsplit<cr>", opts)
keymap("n", "sj", ":set splitbelow<cr>:split<cr>" ,   opts)
keymap("n", "sk", ":set nosplitbelow<cr>:split<cr>",  opts)
keymap("n", "sl", ":set splitright<cr>:vsplit<cr>",   opts)

-- 通过方向键重新设置窗口大小
keymap("n", "<c-up>", ":resize -2<cr>", opts)
keymap("n", "<c-down>", ":resize +2<cr>", opts)
keymap("n", "<c-left>", ":vertical resize -2<cr>", opts)
keymap("n", "<c-right>", ":vertical resize +2<cr>", opts)

-- buffers 导航
keymap("n", "<s-l>", ":bnext<cr>", opts)
keymap("n", "<s-h>", ":bprevious<cr>", opts)

-- 上下移动文本
keymap("n", "<A-j>", "<esc>:m .+1<cr>==gi", opts)
keymap("n", "<A-k>", "<esc>:m .-2<cr>==gi", opts)

-- 保存与退出
keymap("n", "S", ":w<cr>", opts)
keymap("n", "Q", ":q<cr>", opts)

-- 移动光标
keymap("n", "H", "7h", opts)
keymap("n", "J", "5j", opts)
keymap("n", "K", "5k", opts)
keymap("n", "L", "7l", opts)
keymap("n", "<leader>h", "^", opts)
keymap("n", "<leader>l", "$", opts)

-- 复制粘贴
keymap("n", "y", "\"+y", opts)
keymap("n", "Y", "\"+Y", opts)        -- 大写
keymap("n", "p", "\"+p", opts)
keymap("n", "P", "\"+P", opts)        -- 大写
keymap("n", "<leader>y", "y", opts)
keymap("n", "<leader>Y", "Y", opts)   -- 大写
keymap("n", "<leader>p", "p", opts)
keymap("n", "<leader>P", "P", opts)   -- 大写

-- 快速更改单词
keymap("n", "cw", "ciw", opts)   -- 大写

---------- Visual ----------
-- 移动光标
keymap("v", "H", "7h", opts)
keymap("v", "J", "5j", opts)
keymap("v", "K", "5k", opts)
keymap("v", "L", "7l", opts)
keymap("v", "<leader>h", "^", opts)
keymap("v", "<leader>l", "$h", opts)

-- 复制粘贴
keymap("v", "y", "\"+y", opts)
keymap("v", "Y", "\"+Y", opts)        -- 大写
keymap("v", "p", "\"+p", opts)
keymap("v", "P", "\"+P", opts)        -- 大写
keymap("v", "<leader>y", "y", opts)
keymap("v", "<leader>Y", "Y", opts)   -- 大写
keymap("v", "<leader>p", "p", opts)
keymap("v", "<leader>P", "P", opts)   -- 大写

-- 调整缩进
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- 上下移动文本
keymap("v", "<a-j>", ":m .+1<cr>==", opts)
keymap("v", "<a-k>", ":m .-2<cr>==", opts)

---------- visual block ----------
-- 上下移动文本
keymap("x", "<a-j>", ":move '>+1<cr>gv-gv", opts)
keymap("x", "<a-k>", ":move '<-2<cr>gv-gv", opts)


---------- Insert ----------
-- 按 jk 键退出 insert 模式
keymap("i", "jk", "<esc>", opts)
keymap("i", "kj", "<esc>", opts)

-- 移动光标
keymap("i", "<c-h>", "<esc>i",   opts)
keymap("i", "<c-l>", "<esc>lli", opts)
keymap("i", "<c-j>", "<esc>ji",  opts)
keymap("i", "<c-k>", "<esc>ki",  opts)
keymap("i", ";;", "<esc>la",  opts)

---------- Terminal ----------
-- 按 esc 推出输入模式
keymap("t", "<esc>", "<C-\\><C-N>", term_opts)

