" vimrc for windows

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pathogen setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#infect()
call pathogen#helptags()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup items offered by default installation for Windows Vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" No compatibility with VI
set nocompatible

source $VIMRUNTIME/vimrc_example.vim

"source $VIMRUNTIME/mswin.vim
"behave mswin

set diffexpr=MyDiff()
function MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~ ' '
        if &sh =~ '\<cmd'
            let cmd = '""' . $VIMRUNTIME . '\diff"'
            let eq = '"'
        else
            let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
        endif
    else
        let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My personal setup using default commands/values in VIM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tab
set tabstop=4
set shiftwidth=4
set expandtab
" makes the spaces feel like real tabs
set softtabstop=4

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch

" Show line number
set number

" Highlight current line
set cursorline

" Use highlight syntax
" syntax off

" No compatibility with VI
set nocompatible

" Enable filetype detection and loads 'ftplugin.vim'
" http://vimdoc.sourceforge.net/htmldoc/filetype.html
filetype plugin on

" Indent
filetype indent on
set autoindent

" disable folding
set nofoldenable

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color scheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256

let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" colorscheme zenburn

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin related setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically justify table with | using tabular plugin
" From https://gist.github.com/287147
inoremap <silent> <Bar> <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction

" prevent conflict with snipmate and supertab
" https://github.com/amix/vimrc/issues/17
let g:SuperTabDefaultCompletionType = "context"

" EasyAlign
" For visual mode (e.g. vip<Enter>)
vmap <Enter>   <Plug>(EasyAlign)
" For normal mode, with Vim movement (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

" showmarks plugin
" Do not display automatically set marks
" http://stackoverflow.com/questions/8720313/show-marks-plugin-causes-marks-to-pop-in-after-around-4-seconds
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

" airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" use ; as :
nnoremap ; :

" To create markdown level 1 and level 2 header
nnoremap <leader>h1 yypVr=
nnoremap <leader>h2 yypVr-

" Clear all trailing white spaces
" From http://stevelosh.com/blog/2010/09/coming-home-to-vim/
nnoremap <leader>W :%s/\v\s+$//<cr>:let @/ = ""<cr>

" Use 'magic' for search always
" From http://stevelosh.com/blog/2010/09/coming-home-to-vim/
nnoremap / /\v
vnoremap / /\v

" Move by screen line
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Add blank line
" http://vim.wikia.com/wiki/Insert_newline_without_entering_insert_mode
" nnoremap <S-Enter> O<Esc>j
" nnoremap <CR> o<Esc>k
nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>

" Use space and backspace to navigate by 10 lines
" http://zuttobenkyou.wordpress.com/2011/02/15/some-thoughts-on-emacs-and-vim/
nnoremap <space> 10jzz
nnoremap <backspace> 10kzz
nnoremap <S-space> 10kzz

" http://vimcasts.org/episodes/show-invisibles/
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:>-,eol:¬

" Select visual block again after decreasing or increasing indent
vnoremap < <gv
vnoremap > >gv

" move between split
" http://benmccormick.org/2014/07/07/learning-vim-in-2014-working-with-files/
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" http://hashrocket.com/blog/posts/8-great-vim-mappings
" quit using <leader>q
noremap <leader>q :q<cr>
" save using <leader>s
nnoremap <leader>s :w<cr>
inoremap <leader>s <esc>:w<cr>
" apply macro with Q. qq to create macro using register q, quit with q
" apply with Q
nnoremap Q @q
vnoremap Q :norm @q<cr>

" shortcut the close buffer
nnoremap <leader>w :bd<cr>
inoremap <leader>w <esc>:bd<cr>

" NERDTree toggle
" http://stackoverflow.com/questions/2413005/switching-between-tabs-in-nerdtree?rq=1
map <F2> :NERDTreeToggle<cr>

" Clear search terms
nnoremap <leader>cst :let @/ = ""<cr>
nnoremap <F4> :let @/ = ""<cr>

" force refresh or redraw screen
nnoremap <F5> :redraw!<cr>

" copy & paste from system clipboard: F8 to copy/yank, F9 to paste
vnoremap <F8> "+y
nnoremap <F8> gg"+yG<C-o><C-o>
inoremap <F8> <esc>gg"+yG<C-o><C-o>
nnoremap <F9> "+p
inoremap <F9> <esc>"+p

" Replace extended ASCII characters by similar looking ASCII code
function! ToAscii()
    :silent! %s/\%x91/'/g
    :silent! %s/\%x92/'/g
    :silent! %s/\%x93/"/g
    :silent! %s/\%x94/"/g
    :silent! %s/\%x95/ - /g
    :silent! %s/\%x96/-/g
    :silent! %s/\%x97/--/g
    :silent! %s/\%x85/.../g
endfunction

nnoremap <silent> <leader>ta :call ToAscii()<CR>

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

" Script to make pipe table header similar to EMACS org-mode
function! MakePipeTableHeader()
    :silent! normal yyp
    :silent! s/\v[^\|]/-/g
    :silent! s/\v-\|-/-+-/g
endfunction

nnoremap <silent> <leader>mth :call MakePipeTableHeader()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Selectively load spell checker for some file types
" http://jhshi.wordpress.com/2012/11/05/enabledisable-spell-checking-according-to-file-type-in-vim/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" global setting
set nospell

" local
au BufNewFile,BufRead,BufEnter *.tex setlocal spell spelllang=en_us
au BufNewFile,BufRead,BufEnter *.txt setlocal spell spelllang=en_us
au BufNewFile,BufRead,BufEnter *.md setlocal spell spelllang=en_us

