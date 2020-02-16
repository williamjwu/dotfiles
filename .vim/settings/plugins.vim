" ----------------------------------------
"  Plugins should be put after plug#begin
"  Author: William Wu
" ----------------------------------------

call plug#begin('~/.vim/plugins')
Plug 'itchyny/lightline.vim'
let g:lightline = {
            \ 'colorscheme': 'one',
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
let g:polyglot_disabled = ['v']
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'RRethy/vim-illuminate'
Plug 'lilydjwg/colorizer'
Plug 'terryma/vim-multiple-cursors'
Plug 'majutsushi/tagbar'
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
Plug 'Yggdroot/indentLine'
Plug 'darfink/vim-plist'
call plug#end()

