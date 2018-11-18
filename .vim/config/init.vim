" Vim Settings

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
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
" indentation settings
set list lcs=tab:\|\ 

" Nerd tree settings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" Block Comments
filetype plugin on

