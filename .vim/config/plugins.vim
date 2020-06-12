" ----------------------------------------
"  Plugins should be put after plug#begin
"  Author: William Wu
" ----------------------------------------

call plug#begin('~/.vim/plugins')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
        let g:polyglot_disabled = ['v']
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-fugitive'
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'preservim/nerdcommenter'
    Plug 'lilydjwg/colorizer'
    Plug 'majutsushi/tagbar'
        let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
    Plug 'Yggdroot/indentLine'
    Plug 'darfink/vim-plist'
call plug#end()

