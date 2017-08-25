set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 " alternatively, pass a path where Vundle should install plugins
 "call vundle#begin('~/some/path/here')

 " let Vundle manage Vundle, required
 Plugin 'VundleVim/Vundle.vim'

 " added nerdtree
 Plugin 'scrooloose/nerdtree'

 " added emmet-vim
 Plugin 'mattn/emmet-vim'
 Bundle 'indenthtml.vim'
 
call vundle#end()  		" required
filetype plugin indent on      	" required 
nmap <F6> :NERDTreeToggle<CR>

:let g:html_indent_script1 = "inc"
:let g:html_indent_style1 = "inc"
:let g:html_indent_inctags = "html,body,head,tbody"
