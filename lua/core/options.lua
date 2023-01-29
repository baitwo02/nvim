-- :help options
local options = {
  -- 文件
  backup       = true, -- 允许创建备份文件
  swapfile     = true, -- 允许创建交换文件
  undofile     = true, -- 允许创建撤销文件
  autochdir    = true,
  backupdir    = vim.fn.stdpath("config") .. "/tmp/backup", -- 备份文件路径
  directory    = vim.fn.stdpath("config") .. "/tmp/swap", -- 交换文件路径
  undodir      = vim.fn.stdpath("config") .. "/tmp/undo", -- 撤销文件路径
  fileencoding = "utf-8", -- 文件使用 utf8 编码
  writebackup  = false, -- 一个文件正在被编辑, 禁止写备份文件

  -- 操作
  mouse = "a", -- 允许使用鼠标

  -- 搜索
  hlsearch   = true, -- 高亮搜索内容
  ignorecase = true, -- 搜索是忽略大小写
  smartcase  = true, -- 搜索时智能大小写

  -- 缩进
  showtabline = 2, -- 总是显示 tabs
  smartindent = true, -- 让缩进更智能
  expandtab   = true, -- 将 tab 转换为空格
  shiftwidth  = 4, -- 每次缩进所插入的空格数量
  tabstop     = 4, -- 一个 tab 键插入空格数量

  -- 折叠
  foldmethod = "indent", -- 使用 indent 模式折叠
  foldenable = false, -- 当打开一个文件时不允许应用折叠
  foldlevel  = 99, -- 不设置这个, 到处都会有折叠

  -- 界面
  number         = true, -- 显示每行数字
  relativenumber = false, -- 每行前面的数字设置为相对数字
  wrap           = true, -- 展示不完的行会换行展示
  cursorline     = true, -- 高亮鼠标所在行: ture
  cursorcolumn   = false, -- 高亮鼠标所在列: false
  cmdheight      = 1, -- 状态栏高度
  conceallevel   = 0, -- 在 markdown 文件中 `` 符号可见
  pumheight      = 10, -- pop 菜单的高度
  showmode       = true, -- 显示现在模式
  termguicolors  = true, -- 设置允许终端颜色(大部分终端支持此设计)
  timeoutlen     = 500, -- 映射序列允许的间隔时间
  updatetime     = 300, -- faster completion (4000ms default)
  numberwidth    = 4, -- 设置数字列的宽度为2(默认为4)
  signcolumn     = "yes", -- always show the sign column, otherwise it would shift the text each time
  scrolloff      = 8, -- 顶部和底部至少会显示8行
  sidescrolloff  = 8, -- 左右至少会显示8列
  guifont        = "Hack Nerd Font Mono:h17", -- 图形化 neovim 使用的字体
  listchars      = { tab = " ", extends = "⟩", precedes = "⟨", trail = "~", eol = "﬋" },
  showbreak      = "↪ ",
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- vim.cmd [[set whichwrap+=<,>,[,],h,l]] -- 行间能左右跳转
vim.cmd([[set iskeyword+=-]])
vim.cmd([[autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]) -- 自动回到上次退出的位置
vim.cmd([[autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE " transparent bg]]) -- 设置背景透明
