" ----------------------
"  Vim General Settings
"  Author: William Wu
" ----------------------

syntax on
set termguicolors
colorscheme xcodedark
set number
set autoindent
set smartindent
set hlsearch
set mouse=a
set number
set cursorline
set shiftwidth=4
set expandtab
set tabstop=4
set laststatus=2
set statusline=%f\ %h%w%m%r%=%-14.(%l,%c%V%)\ %P
set splitbelow
set splitright
set ttyfast
set ttymouse=xterm2
set timeoutlen=1000 ttimeoutlen=10
set backspace=indent,eol,start

" Block Comments
filetype plugin on

" Fix coc.nvim linting slow
"set updatetime=300

" netrw settings
let g:netrw_dirhistmax = 0
let g:netrw_liststyle = 1

