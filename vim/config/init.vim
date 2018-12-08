" --------------
"  Vim General Settings
" --------------

let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"
set termguicolors
set background=dark
syntax on
set autowrite
set autoindent
set noshowmode
set number relativenumber
set t_Co=256
set cursorline
set shiftwidth=4
set tabstop=4
colorscheme onedark
inoremap jj <Esc>
set laststatus=2
let g:airline_section_x = '%{&filetype}'
set splitbelow
set splitright
set ttyfast
hi link illuminatedWord Visual
let g:airline#extensions#whitespace#enabled = 0

" indentation settings
set list lcs=tab:\|\ 

" Nerd tree settings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Block Comments
filetype plugin on

