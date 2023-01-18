vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guibg=#CD5C5C gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#FF7F50 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guibg=#F0E68C gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guibg=#3CB371 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guibg=#00CED1 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guibg=#4682B4 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent7 guibg=#6A5ACD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append "space: "
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
  space_char_blankline = " ",
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
    "IndentBlanklineIndent7",
  },
}

-- require("indent_blankline").setup {
--   char = "",
--   char_highlight_list = {
--     "IndentBlanklineIndent1",
--     "IndentBlanklineIndent2",
--     "IndentBlanklineIndent3",
--     "IndentBlanklineIndent4",
--     "IndentBlanklineIndent5",
--     "IndentBlanklineIndent6",
--     "IndentBlanklineIndent7",
--   },
-- 
--   space_char_highlight_list = {
--     "IndentBlanklineIndent1",
--     "IndentBlanklineIndent2",
--     "IndentBlanklineIndent3",
--     "IndentBlanklineIndent4",
--     "IndentBlanklineIndent5",
--     "IndentBlanklineIndent6",
--     "IndentBlanklineIndent7",
--   },
--   show_trailing_blankline_indent = false,
-- }
