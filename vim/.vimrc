set number background=dark
set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
set autoindent

set colorcolumn=90
set paste

" remember last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

set foldmethod=indent
set foldlevel=20

au BufNewFile,BufRead *.py set tabstop=4
	\ softtabstop=4
	\ shiftwidth=4
	\ textwidth=79
	\ expandtab
	\ autoindent
	\ fileformat=unix

" au BufNewFile,BufRead *py match BadWhitespace /\s\+$/

" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

" YCM auto close preview window
let g:ycm_autoclose_preview_window_after_completion = 1

