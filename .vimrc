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
Plugin 'kchmck/vim-coffee-script'
Plugin 'digitaltoad/vim-jade'
Plugin 'wavded/vim-stylus'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/emmet-vim'
Plugin 'bling/vim-airline'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'Yggdroot/indentLine'
Plugin 'osyo-manga/vim-over'
Plugin 'kien/ctrlp.vim'
Plugin 'tyok/nerdtree-ack'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'edkolev/tmuxline.vim'

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

" JSON syntax highlighting 
autocmd BufNewFile,BufRead *.json set ft=javascript

" NERDtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-e> :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1

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
