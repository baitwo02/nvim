vim.api.nvim_exec(
    [[
    autocmd filetype markdown inoremap <buffer> ;f <esc>/<++><cr>:nohlsearch<cr>"_c4l
    autocmd filetype markdown nnoremap <buffer> ;f <esc>/<++><cr>:nohlsearch<cr>"_c4l
    autocmd filetype markdown inoremap <buffer> sub <sub></sub><esc>5hi
    autocmd filetype markdown inoremap <buffer> sup <sup></sup><esc>5hi
    ]],
    false
)

-- autocmd filetype markdown inoremap <buffer> tb <sub></sub><esc>5hi
-- autocmd filetype markdown inoremap <buffer> tp <sup></sup><esc>5hi
