local opts = { noremap = true, silent = true }

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

---------- Normal ---------
-- 窗口导航
keymap("n", "<c-h>", "<c-w>h", opts) -- 聚焦到左边窗口
keymap("n", "<c-j>", "<c-w>j", opts) -- 聚焦到下边窗口
keymap("n", "<c-k>", "<c-w>k", opts) -- 聚焦到上边窗口
keymap("n", "<c-l>", "<c-w>l", opts) -- 聚焦到右边窗口
keymap("n", "<leader><c-h>", "<c-w>H", opts) -- 将当前窗口切换到左边
keymap("n", "<leader><c-J>", "<c-w>J", opts) -- 将当前窗口切换到下边
keymap("n", "<leader><c-K>", "<c-w>K", opts) -- 将当前窗口切换到上边
keymap("n", "<leader><c-L>", "<c-w>L", opts) -- 将当前窗口切换到右边

-- 分屏
keymap("n", "sh", ":set nosplitright<cr>:vsplit<cr>", opts) -- 向左边分一块屏
keymap("n", "sj", ":set splitbelow<cr>:split<cr>", opts) -- 向下边分一块屏
keymap("n", "sk", ":set nosplitbelow<cr>:split<cr>", opts) -- 向上边分一块屏
keymap("n", "sl", ":set splitright<cr>:vsplit<cr>", opts) -- 向右边分一块屏

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
keymap("n", "y", '"+y', opts) -- 小写 y 向后复制到 + 寄存器
keymap("n", "Y", '"+Y', opts) -- 大写 Y 先前复制到 + 寄存器
keymap("n", "p", '"+p', opts) -- 小写 p 从 + 寄存器向后粘贴
keymap("n", "P", '"+P', opts) -- 大写 P 从 + 寄存器向前粘贴
keymap("n", "<leader>y", "y", opts) -- 小写 y 向后复制到 _ 寄存器
keymap("n", "<leader>Y", "Y", opts) -- 大写 Y 先前复制到 _ 寄存器
keymap("n", "<leader>p", "p", opts) -- 小写 p 从 _ 寄存器向后粘贴
keymap("n", "<leader>P", "P", opts) -- 大写 P 从 _ 寄存器向前粘贴

-- 快速更改单词
keymap("n", "cw", "ciw", opts)
keymap("n", "dw", "diw", opts)
keymap("n", "yw", "yiw", opts)
keymap("n", "pw", "viwp", opts)

---------- Visual ----------
-- 移动光标
keymap("v", "H", "7h", opts)
keymap("v", "J", "5j", opts)
keymap("v", "K", "5k", opts)
keymap("v", "L", "7l", opts)
keymap("v", "<leader>h", "^", opts)
keymap("v", "<leader>l", "$h", opts)

-- 复制粘贴
keymap("v", "y", '"+y', opts) -- 小写 y 向后复制到 + 寄存器
keymap("v", "Y", '"+Y', opts) -- 大写 Y 先前复制到 + 寄存器
keymap("v", "p", '"+p', opts) -- 小写 p 从 + 寄存器向后粘贴
keymap("v", "P", '"+P', opts) -- 大写 P 从 + 寄存器向前粘贴
keymap("v", "<leader>y", "y", opts) -- 小写 y 向后复制到 _ 寄存器
keymap("v", "<leader>Y", "Y", opts) -- 大写 Y 先前复制到 _ 寄存器
keymap("v", "<leader>p", "p", opts) -- 小写 p 从 _ 寄存器向后粘贴
keymap("v", "<leader>P", "P", opts) -- 大写 P 从 _ 寄存器向前粘贴

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

-- 快速移动光标
keymap("v", "<leader>h", "^", opts)
keymap("v", "<leader>l", "$h", opts)

---------- Insert ----------
-- 按 jk 键退出 insert 模式
keymap("i", "jk", "<esc>", opts)
keymap("i", "kj", "<esc>", opts)

-- 移动光标
keymap("i", "<c-h>", "<esc>i", opts)
keymap("i", "<c-l>", "<esc>lli", opts)
keymap("i", "<c-j>", "<esc>jli", opts)
keymap("i", "<c-k>", "<esc>kli", opts)
keymap("i", ";;", "<esc>la", opts)

---------- Terminal ----------
-- 按 esc 推出输入模式
keymap("t", "<esc>", "<C-\\><C-N>", opts)
