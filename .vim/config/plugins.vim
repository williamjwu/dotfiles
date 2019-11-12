" ----------------------------------------
"  Plugins should be put after plug#begin
"  Author: William Wu
" ----------------------------------------

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
let g:lightline = {
            \ 'colorscheme': 'onedark',
            \ 'active': {
            \ 'left': [ [ 'mode', 'paste' ],
            \ 			[ 'gitbranch', 'readonly', 'filename'] ],
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head',
            \	'filename': 'LightlineFilename'
            \ },
            \ }
function! LightlineFilename()
    let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
    let modified = &modified ? ' +' : ''
    return filename . modified
endfunction
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'RRethy/vim-illuminate'
let g:Illuminate_ftblacklist = ['nerdtree']
Plug 'lilydjwg/colorizer'
Plug 'terryma/vim-multiple-cursors'
Plug 'majutsushi/tagbar'
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
Plug 'Yggdroot/indentLine'
Plug 'darfink/vim-plist'
call plug#end()

