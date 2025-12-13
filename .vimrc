" Add .tpp to cpp file highlighting
au BufRead,BufNewFile *.tpp set filetype=cpp
" Disable vi compatability
set nocompatible

" Enable file type detection
filetype on

" Enable plugins and load plugin for filetype
filetype plugin on

" Load indent file for the detected file type
filetype indent on

" Enable syntax highlighting
syntax on

" Line numbers
set number

" Highlight cursor line
set cursorline

" Highlight cursorline vertically
set cursorcolumn

" Set shiftwidth to 2 spaces
set shiftwidth=2 smarttab

" Set tab to 2 columns.
set tabstop=2

" Space characters instead of tabs
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines
set scrolloff=10

" Do not wrap lines
set nowrap

" Incremental search
set incsearch

" Ignore capital letters during search
set ignorecase

" Override ignore case for capital letter search
set smartcase

" Show partial command
set showcmd

" Show mode
set showmode

" Show matching words
set showmatch

" Use highlighting during a search
set hlsearch

" Set history of commands to save
set history=1000

" Enable autocompletion after tab
set wildmenu

" Make wildmenu behave like Bash completion
set wildmode=list:longest

" Wildmenu file ignores
set wildignore=*.docx,*.jpeg,*.jpg,*.png,*.wav,*.aiff,*.flac,*.mp3,*.pdf,*.exe,*.flv,*.img,*.xlsx

" code shifting
vnoremap < <gv
vnoremap > >gv

" PLUGINS ---------------------------------------------------------------- {{{

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')

"	Plug 'dense-analysis/ale'

	Plug 'preservim/nerdtree' |
		\ Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'sonph/onehalf', {'rtp': 'vim/'}
  Plug 'tpope/vim-commentary'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'bfrg/vim-c-cpp-modern'
	Plug 'morhetz/gruvbox'

call plug#end()
" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Set backslash as the leader key.
let mapleader = '\'

" Press \\ to jump back to the last cursor position.
nnoremap <leader>\ ``

" Type jj to exit insert mode quickly.
inoremap jj <esc>

" Press the spacebar to type : in command mode
nnoremap <space> :

" Pressing the leter o will open a new line below the current one.
" Exist insert mode after creating a new line above or below.
nnoremap o o<esc>
nnoremap O O<esc>

" Center the cursor verticall when moving to the next word during a search.

nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to end of line.
nnoremap Y y$

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><


" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle<cr>

"map <C-l> :tabn<CR>
"map <C-h> :tabp<CR>
"map <C-n> :tabnew<CR>

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
 augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
 augroup END

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
" }}}


" STATUS LINE ------------------------------------------------------------ {{{
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" }}}

"
set t_Co=256
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif
colorscheme gruvbox
let g:airline_theme='gruvbox'

set background=dark
