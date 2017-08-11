call plug#begin('~/.vim/plugged')

" Syntax and language specific
Plug 'tpope/vim-git'
Plug 'vim-ruby/vim-ruby'
Plug 'othree/html5.vim'
Plug 'leshill/vim-json'
Plug 'tpope/vim-markdown'
Plug 'ElmCast/elm-vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript', { 'for': 'typescript' }
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" Actual Plugs
Plug 'easymotion/vim-easymotion'
Plug 'vimlab/split-term.vim'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'editorconfig/editorconfig-vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-ragtag'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'gorkunov/smartpairs.vim'
Plug 'thinca/vim-visualstar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-vinegar'
Plug 'Shougo/neosnippet.vim'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'janko-m/vim-test'
Plug 'tpope/vim-endwise'
Plug 'mattn/emmet-vim'

call plug#end()

set nocompatible

let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }


let g:jsx_ext_required = 0

"Add extra filetypes
let g:tern#filetypes = [
\ 'jsx',
\ 'javascript.jsx',
\ ]

filetype plugin indent on

let g:neosnippet#snippets_directory = '~/.config/nvim/UltiSnips'
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

let g:tsuquyomi_disable_default_mappings = 1

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

set shiftround
set noshowcmd
set nofoldenable
map K <Nop>

" CHARLIE - Re-enable following line
"set inccommand=split

set background=dark

runtime macros/matchit.vim

" wrap quickfix window
autocmd FileType qf setlocal wrap linebreak

autocmd BufNewFile,BufRead .babelrc setlocal filetype=json
autocmd BufNewFile,BufRead .eslintrc setlocal filetype=json

function! SyntaxItem()
  echo synIDattr(synID(line("."),col("."),1),"name")
endfunction

" Ale status line - last empty string = no message when everything is OK
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '']

" status bar
set statusline=%F%m%r%h%w\  "fullpath and status modified sign
set statusline+=\ %y "filetype
set statusline+=\ %{fugitive#statusline()}
set statusline+=\ %{ALEGetStatusLine()}
" this line below pushes everything below it to the right hand side
set statusline+=%=
set statusline+=\%l

" assume the /g flag on :s substitutions to replace all matches in a line
set gdefault

set autoread

set breakindent

" fix slight delay after pressing ESC then O http://ksjoberg.com/vim-esckeys.html
set timeout timeoutlen=500 ttimeoutlen=100

set history=500
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

set ignorecase smartcase

set spelllang=en_gb
syntax spell toplevel

autocmd FileType markdown setlocal shiftwidth=4 softtabstop=4 tabstop=4 wrap linebreak nolist wrap lbr colorcolumn=0 synmaxcol=999999
autocmd FileType elm setlocal shiftwidth=4 softtabstop=4 tabstop=4

set laststatus=2

set linebreak

set incsearch
set hlsearch

set scrolloff=5

set nobackup
set nowritebackup
set noswapfile

set backspace=indent,eol,start

set wildmode=full
set wildmenu

let mapleader=","
noremap \ ,

set wildignore+=*.o,*.obj,.git,node_modules,_site,*.class,*.zip,*.aux

set number

" clear highlights by hitting ESC
" or by hitting enter in normal mode
nnoremap <CR> :noh<CR><CR>

set list listchars=tab:»·,trail:·

command! Q q

set splitbelow
set splitright

set tags=./.tags;

autocmd BufNewFile,BufRead *.tsx set filetype=typescript.jsx

" make the completion menu a bit more readable
highlight PmenuSel ctermbg=white ctermfg=black
highlight Pmenu ctermbg=black ctermfg=white

" so it's clear which paren I'm on and which is matched
highlight MatchParen cterm=none ctermbg=none ctermfg=yellow

"few nicer JS colours
highlight xmlAttrib ctermfg=121
highlight jsThis ctermfg=224
highlight jsSuper ctermfg=13
highlight jsFuncCall ctermfg=cyan
highlight jsComment ctermfg=245 ctermbg=none
highlight jsClassProperty ctermfg=14 cterm=bold

" ~~~ MAPPINGS BELOW ~~~

"gtfo ex mode
map Q <Nop>

" vim-test
map <Leader>e :TestFile<CR>
map <Leader>n :TestNearest<CR>
map <Leader>l :TestLast<CR>
map <Leader>s :TestSuite<CR>

" new file in current directory
map <Leader>nf :e <C-R>=expand("%:p:h") . "/" <CR>

" toggle spellcheck
map <leader>sc :setlocal spell!<CR>

map <leader>v :vsplit<CR>

" clean up any trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

" Don't add the comment prefix when I hit enter or o/O on a comment line.
autocmd FileType * setlocal formatoptions-=r formatoptions-=o

noremap H ^
noremap L $

" http://blog.petrzemek.net/2016/04/06/things-about-vim-i-wish-i-knew-earlier/
" better jk normally but don't remap when it's called with a count
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" FZF.vim
nnoremap <leader>t :Files<cr>
nnoremap <leader>b :Buffers<cr>

" CHARLIE - added easymotion mappings for char, line, and word
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" let g:fzf_prefer_tmux = 1

" Elm.vim settings
let g:elm_format_autosave = 1
let g:elm_setup_keybindings = 0

" make copy/paste from system clip easier
vnoremap <leader>8 "*y
vnoremap <leader>9 "*p
nnoremap <leader>8 "*p

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
" disable the Ale HTML linters
let g:ale_linters = {
\   'html': [],
\}
let g:ale_set_highlights = 0

" stop Elm.vim trying to show compiler erorrs in Vim
let g:elm_format_fail_silently = 1

" set Prettier up to run on save
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = [
\ 'prettier', 'eslint'
\]
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --no-semi'

if has('nvim')
  tnoremap <c-h> <c-\><c-n><c-w>h
  tnoremap <c-j> <c-\><c-n><c-w>j
  tnoremap <c-k> <c-\><c-n><c-w>k
  tnoremap <c-l> <c-\><c-n><c-w>l

  autocmd BufWinEnter,WinEnter term://* startinsert

  let test#strategy = 'neovim'
endif

set completeopt-=preview

" so Emmet.vim will work in JSX
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends': 'jsx',
\      'quote_char': '"',
\  },
\}

