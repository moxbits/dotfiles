syntax on
set laststatus=3 " one global status line
set nobackup " disables the creation of backup files

set clipboard=unnamedplus
set clipboard+=unnamed

set completeopt=menuone,noselect " mostly for completion (e.g., with 'cmp')
set conceallevel=0 " so that `` is visible in markdown files
set encoding=utf-8 " the encoding written to a file
set hlsearch " highlight all matches on previous search pattern
set ignorecase " ignore case in search patterns
set mouse=a " allow the mouse to be used in Vim

filetype plugin indent on
set autoindent " enabling auto indent
set smartcase " smart case
set smartindent " make indenting smarter again

set splitbelow " force all horizontal splits to go below the current window
set splitright " force all vertical splits to go to the right of the current window
set noswapfile " disables the creation of swap files
set termguicolors " set term gui colors (most terminals support this)
set timeoutlen=1000 " time to wait for a mapped sequence to complete (in milliseconds)
set undofile " enable persistent undo
set updatetime=300 " faster completion (4000ms default)
set nowritebackup " if a file is being edited by another program, it is not allowed to be edited
set expandtab " convert tabs to spaces
set shiftwidth=2 " the number of spaces inserted for each indentation
set tabstop=2 " insert 2 spaces for a tab
set number " set line numbers
set relativenumber " set relative line numbers
set guifont=monospace:h17 " the font used in graphical Vim applications

let g:netrw_browse_split=0
set whichwrap+=<,>,[,],h,l
set iskeyword+=-


colorscheme torte

hi Normal guibg=black ctermbg=black
hi NormalNC guibg=black ctermbg=black

hi LineNr guibg=black ctermbg=black
hi CursorLine guibg=#222222
hi CursorLineNr guibg=#222222

hi SignColumn guibg=black ctermbg=black



" Remap space as leader key
nnoremap <Space> <Nop>
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" Normal Mode
" Explorer
nnoremap <leader>e :Lex<CR>

" Window Navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Navigate buffers
nnoremap <leader>bh :bfirst<CR>
nnoremap <leader>bk :bnext<CR>
nnoremap <leader>bj :bprevious<CR>
nnoremap <leader>bl :blast<CR>

" Delete without yanking
nnoremap <leader>d "_d

" Move text up and down
nnoremap <A-j> <Esc>:m .+1<CR>==gi
nnoremap <A-k> <Esc>:m .-2<CR>==gi

" Insert Mode
" Press jk fast to exit insert mode
inoremap jk <Esc>
inoremap kj <Esc>

" Visual Mode
" Stay in indent mode
vnoremap < <gv
vnoremap > >gv

" Move text up and down
vnoremap <A-j> :m .+1<CR>==
vnoremap <A-k> :m .-2<CR>==
vnoremap <leader>p "_dP
vnoremap <leader>d "_d

" Visual Block Mode
" Move text up and down
xnoremap J :move '>+1<CR>gv-gv
xnoremap K :move '<-2<CR>gv-gv
xnoremap <A-j> :move '>+1<CR>gv-gv
xnoremap <A-k> :move '<-2<CR>gv-gv

" Custom Command
nnoremap <esc><esc> :nohlsearch<CR>

