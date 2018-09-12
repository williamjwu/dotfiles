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

" abbreviations
abbr psvm public static void main(String[] args) {<CR>}
abbr sout System.out.println();
abbr fori for (int i = 0; i < 1; i++) {<CR>}

