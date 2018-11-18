" Vundle Plugins

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
		let g:airline#extensions#tabline#enabled=1
		let g:airline_powerline_fonts=1
	Plugin 'vim-airline/vim-airline-themes'
	Plugin 'Valloric/YouCompleteMe'
	Plugin 'scrooloose/nerdtree'
	Plugin 'ryanoasis/vim-devicons'
	Plugin 'scrooloose/nerdcommenter'
	Plugin 'tpope/vim-fugitive'
	Plugin 'tpope/vim-surround'
	Plugin 'RRethy/vim-illuminate'
		let g:Illuminate_ftblacklist = ['nerdtree']
	Plugin 'jiangmiao/auto-pairs'
	"Plugin 'jszakmeister/vim-togglecursor'
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
