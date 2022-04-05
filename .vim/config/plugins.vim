" ----------------------------------------
"  Plugins should be put after plug#begin
"  Author: William Wu
" ----------------------------------------

call plug#begin('~/.vim/plugins')
    Plug 'itchyny/lightline.vim'
    Plug 'sheerun/vim-polyglot'
        let g:python_highlight_space_errors = 0
    Plug 'tpope/vim-fugitive'
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'preservim/nerdcommenter'
    Plug 'lilydjwg/colorizer'
    Plug 'majutsushi/tagbar'
        let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
    Plug 'darfink/vim-plist'
call plug#end()

