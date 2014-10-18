" LaTeX filetype plugin

" Run PDFTeXify and close the window automatically (can be problem with errors)
" need texify
" http://vim.1045645.n5.nabble.com/hit-any-key-to-close-this-window-td1166224.html
nnoremap <leader>tp :w <bar> silent ! texify --pdf %<CR>

" Script to convert Test bank to latex form
function! MakeMultipleChoice()
    :silent! call ToAscii()<CR>
    :silent! g/^\s*$/d
    :silent! :1
    " need trailing space in this line. Do not delete!
    :silent! normal I\question 
    :silent! g/\v^a./normal O\begin{choices}
    :silent! g/\v^e./normal o\end{choices}
    :silent! %s/\v^[abcde]./    \\choice/g
    :silent! %s/\v\$/\\$/g
    :silent! %s/\v\&/\\&/g
    :silent! %s/\v\%/\\%/g
    :silent! %s/\v_+/\\blankplaceholder/g
    :silent! :retab
    :silent! normal Go
endfunction

nnoremap <silent> <leader>mmc :call MakeMultipleChoice()<CR>

"" Change \choice -> \correctchoice: 
"" 'ak' means answer key
nnoremap <leader>ak :s/choice/correctchoice/g <bar> :let @/ = "" <CR>

