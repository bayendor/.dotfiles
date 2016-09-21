set nocompatible    " choose no compatibility with legacy vi
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Keep Plugin commands between vundle#begin/end.

Plugin 'gmarik/Vundle.vim'  " let Vundle manage Vundle, required
Plugin 'ntpeters/vim-better-whitespace.git'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'scrooloose/nerdtree'
Plugin 'saltstack/salt-vim'
Plugin 'tpope/vim-bundler'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'janko-m/vim-test'
Plugin 'fatih/vim-go'

call vundle#end()         " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

filetype plugin indent on

runtime macros/matchit.vim
syntax enable
set showcmd          " display incomplete commands
set encoding=utf-8
set nrformats=       " treat all #'s as decimal

" Whitespace
set nowrap                      " don't wrap lines
set ts=2 sts=2 sw=2 expandtab   " a tab is two spaces
set backspace=indent,eol,start  " backspace in insert mode

"" Searching
set hlsearch      " highlight matches
set incsearch     " incremental searching
set ignorecase    " search case insensitive
set smartcase     " ...unless contains 1 capital letter
nnoremap <silent> <F2> :<C-u>nohlsearch<CR><C-l>

" Show Invisibles - vimcasts #1
nmap <leader>i :set list!<CR>
set listchars=tab:▸\ ,eol:¬,trail:•

if has("autocmd")
  " Source vimrc after saving - vimcasts #24
  autocmd! bufwritepost .vimrc source $MYVIMRC

  " Set filetypes
  autocmd BufRead,BufNewFile *.md set filetype=markdown
endif

" Split window settings
set splitbelow
set splitright

" Re-map window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Display settings
set t_Co=256
set number
if has('gui_running')
  set guifont=Hack:h13
  silent! colorscheme solarized
  set background=light
else
  silent! colorscheme default
endif
set cursorline
set mouse=a
call togglebg#map("<F5>")

" Swap files
set noswapfile
set nobackup
set nowb

" File messages and options
set shortmess=atI
set wildmode=list:longest
set wildignore=*.o,*.obj,*~,*.swp,.DS_Store

" Add ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let l:win_view = winsaveview()
  let l:last_search = getreg('/')

  " execute the command without adding to the changelist/jumplist:
  execute 'keepjumps ' . a:command

  " Clean up: restore previous search history, and cursor position
  call winrestview(l:win_view)
  call setreg('/', l:last_search)
endfunction

" Delete trailing whitespace
nnoremap <silent> <leader>dw :StripWhitespace<cr>

" Reindent entire file
nnoremap <silent> <leader>e :call Preserve("normal! gg=G")<cr>

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" NERDTree Settings
let NERDTreeHijackNetrw=1
map <C-n> :NERDTreeToggle<CR>

" vim-test mappings
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>

" Enable 'dot' command for Visual mode
:xnoremap . :normal .<CR>

" Enable visual macro execution with '@'
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Allow y & p commands to access system clipboard
set clipboard=unnamed

" Add Golang Support
let g:go_disable_autoinstall = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

