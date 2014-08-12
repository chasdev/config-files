set nocompatible
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
let g:vundle_default_git_proto='git'
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

Plugin 'gmarik/vundle'
Plugin 'vim-airline'
Plugin 'mileszs/ack.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'sjl/gundo.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'tsukkee/unite-tag'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'fatih/vim-go'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown' 
Plugin 'moll/vim-node'
Plugin 'Gundo'

call vundle#end()          

"" Use spaces for tabs, and set indent for file types
"autocmd Filetype groovy setlocal ts=4 sts=4 sw=4
"autocmd Filetype groovy setlocal ts=4 sts=4 sw=4
"autocmd Filetype groovy setlocal ts=4 sts=4 sw=4
"autocmd Filetype groovy setlocal ts=4 sts=4 sw=4
"autocmd Filetype groovy setlocal ts=4 sts=4 sw=4
"autocmd Filetype html setlocal ts=2 sts=2 sw=2
"autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
"autocmd Filetype java setlocal ts=4 sts=4 sw=4
"autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
"autocmd Filetype scala setlocal ts=4 sts=4 sw=4

""autocmd BufWritePre *.py :%s/\s\+$//e
"autocmd FileType groovy,java,javascript,markdown autocmd FileWritePre    * :%s/\s\+$//e
"autocmd FileType groovy,java,javascript,markdown autocmd FileAppendPre   * :%s/\s\+$//e
"autocmd FileType groovy,java,javascript,markdown autocmd FilterWritePre  * :%s/\s\+$//e
"autocmd FileType groovy,java,javascript,markdown autocmd BufWritePre     * :%s/\s\+$//e

let mapleader=","

" Simplify zooming - using ZoomWin version 25i
" git@github.com:vits/ZoomWin.git  (ver 24 results in E3 File Exists errors)
nmap <leader>z <c-w>o

"" Unite bindings (find files)
" First, we'll make it easy to change the Unite prefix
nnoremap [unite] <Nop>
nmap <space> [unite]

" then use it to define a binding like Command-T
map [unite]f :Unite -no-split -start-insert file_rec/async<cr>
map [unite]g :Unite -no-split grep:.<cr>
map [unite]b :Unite -no-split buffer<cr>
map [unite]t :!retag<cr>:Unite -no-split -auto-preview -start-insert tag<cr>

"" Make netrw show a tree view by default
let g:netrw_liststyle = 3
let g:netrw_list_hide = '.git,tags,.sass-cache,.jpg,.png,.svg'

"" Show numbers using ,n to toggle relative numbering
set number
nnoremap <leader>n :set norelativenumber!<CR>




"" Snippets (Snipmate) configuration
"let g:snippets_dir = "~/.vim-bundles/my-snippets"

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

" sudo write this
cmap W! w !sudo tee % >/dev/null

" Reload Vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" and lets make these all work in insert mode too ( <C-O> makes next cmd
"  happen as if in command mode )
imap <C-W> <C-O><C-W>

" Load the Gundo window
map <leader>g :GundoToggle<CR>

" ==========================================================
" Basic Settings
" ==========================================================
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set number                    " Display line numbers
set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.

" don't bell or blink
set noerrorbells
set vb t_vb=

" Ignore these files when completing
set wildignore+=*.o,*.obj,*.pyc,*.class,target/**,.git,.swp

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Disable the colorcolumn when switching modes.  Make sure this is the
" first autocmd for the filetype here
"autocmd FileType * setlocal colorcolumn=0

let g:vim_markdown_folding_disabled=1

""" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set wrap                    " Wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces 
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set formatoptions=tcroql    " Setting text and comment formatting to auto
set textwidth=80            " Lines are automatically wrapped after 80 columns

"""" Reading/Writing
set autowrite               " Stop complaining about unsaved buffers
set autowriteall            " 
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.

"""" Messages, Info, Status
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

" Paste from clipboard
map <leader>p "+p

" Quit window on <leader>q
nnoremap <leader>q :q<CR>

" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Select the item in the list with enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

map <C-space> :bn <CR>
map <C-M-space> :bp <CR>

colorscheme solarized
set background=dark

set noswapfile
if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif
hi DiffText gui=underline guibg=red guifg=black
set guifont=Monaco:h14

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

