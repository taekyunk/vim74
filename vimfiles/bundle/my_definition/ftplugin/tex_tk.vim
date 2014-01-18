" LaTeX filetype plugin

" Run PDFTeXify and close the window automatically (can be problem with errors)
" http://vim.1045645.n5.nabble.com/hit-any-key-to-close-this-window-td1166224.html
" nnoremap <leader>pt :silent ! texify --pdf %<CR>
nnoremap <leader>pt :w <bar> silent ! texify --pdf %<CR>

""  Function (mostly borrowed from tex_pdf
"function! <SID>ViewTexPdf(...)
"    if a:0 == 0
"        let l:target = expand("%:p:r") . ".pdf"
"    else
"        let l:target = a:1
"    endif
"	silent execute "! sumatrapdf -invert-colors ".l:target
"    if v:shell_error
"        redraw!
"    endif
"endfunction
"
"
"" Define command
"command! -buffer -nargs=* PdfOpen call s:ViewTexPdf(0, <f-args>)
"
"" Map keys
"noremap <buffer> <silent> <Leader>po <Esc>:PdfOpen<CR>
