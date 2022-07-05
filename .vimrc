set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'preservim/nerdcommenter'
Plugin 'iamcco/markdown-preview.nvim'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'preservim/tagbar'
Plugin 'junegunn/gv.vim'
Plugin 'sillybun/vim-repl'

call vundle#end()
filetype plugin indent on

syntax on

let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_empty_buffer = 0

" Settings for vim-repl
let g:repl_program = {
            \   'python': 'ipython',
            \   'pytnon-debug': 'ipdb3',
            \   'default': 'zsh',
            \   'r': 'R',
            \   'lua': 'lua',
            \   'vim': 'vim -e',
            \   }

autocmd FileType python nnoremap <leader>r :REPLToggle<CR>

let mapleader = ","

color ron

set tabstop=4
set shiftwidth=4
set shiftround
set wrap
set laststatus=2

let _curfile = expand("%:t")
if _curfile =~ "Makefile" || _curfile =~ "makefile" || _curfile =~ ".*\.mk"
    set noexpandtab
else
    set expandtab
endif

set hlsearch

set number

inoremap jk <esc>

nnoremap <S-up> <nop>
nnoremap <S-down> <nop>
nnoremap Q <nop>

inoremap <c-u> <esc>bviwUea

nnoremap <leader>ev :vsp ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>

nnoremap <leader>n :nohl<cr>

" copy into clipboard
vnoremap <leader>c "*y

" Suround things with quotes
vnoremap <leader>" xi""<esc>hp

" Remove unwanted white spaces
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Make c project
autocmd FileType c,cpp nnoremap <buffer> <F2> :!clear<cr>:!make && valgrind --error-exitcode=1 -q --leak-check=full ./test/test_suite<cr>

command! W w
command! Q q
