set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()

	Plugin 'VundleVim/Vundle.vim'
		let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
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
	Plugin 'terryma/vim-multiple-cursors'
	Plugin 'junegunn/fzf.vim'
	" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

