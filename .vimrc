let g:onedark_termcolors=256
set guifont=Monaco\ for\ Powerline:h12
set guioptions=
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-devicons'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let g:airline_powerline_fonts=1
set termguicolors
set background=dark
syntax on
set autowrite
set autoindent
set noshowmode
set number
set t_Co=256
set cursorline
set shiftwidth=4
set tabstop=4
colorscheme onedark
inoremap jj <Esc>
set laststatus=2
let g:airline_section_x = '%{&filetype}'
map <C-a> <esc>ggVG<CR>
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-x> "+d
set splitbelow
set splitright
map <C-d> <C-w><C-w>
map <C-t> <C-w><C-v>
set ttyfast
" indentation settings
set list lcs=tab:\|\ 

" Nerd tree settings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" abbreviations
abbr psvm public static void main(String[] args) {<CR>}
abbr sout System.out.println();
abbr fori for (int i = 0; i < 1; i++) {<CR>}

