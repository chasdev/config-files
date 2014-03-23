set nocompatible

execute pathogen#infect('bundle/{}', '~/.vim-bundles/{}')
syntax on
filetype plugin indent on

let mapleader=","

let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

"" map leader-l to open previous (last) buffer
nnoremap <leader>. <c-^>

"" Simplify window navigation
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>h <C-W>h
map <leader>l <C-W>l

" Simplify zooming - using ZoomWin version 25i
" git@github.com:vits/ZoomWin.git  (ver 24 results in E3 File Exists errors)
nmap <leader>o <c-w>o

"" Show numbers, ,n to toggle relative numbering
set number
nnoremap <leader>n :set norelativenumber!<CR>

"" Exclude directories from listings
:set wildignore+=*.class,target/**,.git

"" Support repeated pasting following a yank
xnoremap p pgvy
xnoremap P Pgvy

"" Copy to OS X clipboard usig Ctrl-x and Ctrl-c as normal"
" TODO: Copy grabs entire line versus just the selection
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

"" Toggle paste
" pastetoggle http://stackoverflow.com/questions/2861627/paste-in-insert-mode
" set paste
set pastetoggle=<F2>

"" Paste from OS X clipboard using Ctrl-k
" TODO: Paste incorrectly inserts a return before pasting
"nmap <C-k> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
"imap <C-k> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>

" ***************************  Groovy support  ***************************

let g:tagbar_type_groovy = {
    \ 'ctagstype' : 'groovy',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'c:class',
        \ 'i:interface',
        \ 'f:function',
        \ 'v:variables',
    \ ]
    \ }

"" Navigation functions (open class file, find subclasses)
" from:  http://www.objectpartners.com/2012/02/21/using-vim-as-your-grails-ide-part-1-navigating-your-project/
" (except using Ack versus Grep)
map <C-i> :call OpenVariableUnderCursor(expand("<cword>"))<CR>
map <Leader>s :silent call FindSubClasses(expand("<cword>"))<CR>

function! OpenVariableUnderCursor(varName)
    let filename = substitute(a:varName,'(<w+>)', 'u1', 'g')
    :call OpenFileUnderCursor(filename)
endfunction

function! OpenFileUnderCursor(filename)
    let ext = fnamemodify(expand("%:p"), ":t:e")
    execute ":find " . a:filename . "." . ext
endfunction

function! FindSubClasses(classname)
    execute ":Ack '\(implements\\|extends\) " . a:classname . "' *"
endfunction
