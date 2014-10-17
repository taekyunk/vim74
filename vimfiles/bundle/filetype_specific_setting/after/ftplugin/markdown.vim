" Vim filetype plugin
" Language:		Markdown

" To create markdown level 1 and level 2 header
nnoremap <leader>h1 yypVr=
nnoremap <leader>h2 yypVr-

nnoremap <leader>tp :w <bar> silent ! md2pdf %<CR>
nnoremap <leader>tw :w <bar> silent ! md2word %<CR>
nnoremap <leader>tb :w <bar> silent ! md2beamer %<CR>

