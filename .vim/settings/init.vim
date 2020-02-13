" ----------------------
"  Vim General Settings
"  Author: William Wu
" ----------------------

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

set termguicolors
colorscheme xcodedark
set background=dark
syntax on
set mouse=a
set hidden
set autoindent
set nocompatible
set noshowmode
set number
set t_Co=256
set cursorline
set shiftwidth=4
set expandtab
set tabstop=4
set laststatus=2
set splitbelow
set splitright
set ttyfast
set ttymouse=xterm2
hi link illuminatedWord Visual
set timeoutlen=1000 ttimeoutlen=10
set backspace=indent,eol,start

" Block Comments
filetype plugin indent on

" Fix coc.nvim linting slow
set updatetime=300

" netrw settings
let g:netrw_dirhistmax = 0
let g:netrw_liststyle = 1

