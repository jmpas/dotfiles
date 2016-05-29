set nocompatible              " be iMproved, required
filetype off                  " required

let mapleader = ','

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'digitaltoad/vim-jade'
Plugin 'wavded/vim-stylus'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/emmet-vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'Yggdroot/indentLine'
Plugin 'osyo-manga/vim-over'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'slim-template/vim-slim.git'
Plugin 'nikvdp/ejs-syntax' 
Plugin 'rking/ag.vim'

" All of your Plugins must be added before the following line
call vundle#end()
syntax enable
colorscheme Glacier 
filetype plugin indent on

" Default indent settings
set tabstop=2
set shiftwidth=2

" vim-stylus stuff
autocmd BufNewFile,BufReadPost *.styl set filetype=stylus
set expandtab

set wrap "dont wrap lines
set linebreak "wrap lines at convenient point
set cursorline
set number

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/](.git|node_modules)$'

" JSON syntax highlighting 
autocmd BufNewFile,BufRead *.json set ft=javascript

" Vimfiler
let g:vimfiler_tree_indentation = 1
let g:vimfiler_tree_leaf_icon = '┆'
let g:vimfiler_tree_opened_icon = '▼'
let g:vimfiler_tree_closed_icon = '▷'
let g:vimfiler_file_icon = ' '
let g:vimfiler_readonly_file_icon = '⭤'
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_ignore_pattern = '^\%(.git\|.idea\|.DS_Store\|node_modules\)$'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Airline fix
let g:airline_powerline_fonts = 1

let g:vimfiler_as_default_explorer = 1

" 'vim-over' find and replace shortcut
function! VisualFindAndReplace()
    :OverCommandLine%s/
    :w
endfunction
function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s/
    :w
endfunction

nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
noremap <Leader>frs :call VisualFindAndReplaceWithSelection()<CR>
