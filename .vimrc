set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'davidhalter/jedi-vim'

call vundle#end()
filetype plugin indent on

syntax on

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

nnoremap <leader>/ :s,^,//,<cr>:nohl<cr>
nnoremap <C-_> :s,//,,<cr>:nohl<cr>
nnoremap <leader>s :%s/\<<C-r><C-w>\>/

vnoremap <leader>/ :s,^,//,<cr>:nohl<cr>
vnoremap <C-_> :s,//,,<cr>:nohl<cr>
vnoremap <leader>" xi""<esc>hp

nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
nnoremap <F2> :!clear<cr>:!make && valgrind --error-exitcode=1 -q --leak-check=full ./test/test_suite<cr>

command! W w
command! Q q
