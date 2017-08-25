set nocompatible
filetype on

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

 " added solarized
 Plugin 'altercation/vim-colors-solarized'

 " added YouCompleteMe
 Plugin 'Valloric/YouCompleteMe'

 " added ctrlp.vim
 Plugin 'ctrlpvim/ctrlp.vim'
 
 " added vim-airline
 Plugin 'vim-airline/vim-airline'

 " added vim-airline-themes
 Plugin 'vim-airline/vim-airline-themes'

call vundle#end()  		" required
filetype plugin indent on      	" required 
nmap <F6> :NERDTreeToggle<CR>

:let g:html_indent_script1 = "inc"
:let g:html_indent_style1 = "inc"
:let g:html_indent_inctags = "html,body,head,tbody"


"emmet trigger
let g:user_emmet_leader_key='<C-Z>'

"solarized options
syntax enable
set background=dark
colorscheme solarized

" airline-themes
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
