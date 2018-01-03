set nocompatible

syntax enable
filetype on

set relativenumber
set number

filetype plugin indent on      	" required 
" map <F6> to toggle NERDTree
nmap <F6> :NERDTreeToggle<CR>

" map CTRL+J to add new line in normal mode
nnoremap <NL> A <CR><ESC>

set nowrap
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required`
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

"added vim-surround

Plugin 'tpope/vim-surround'

"added vim-repeat
Plugin 'tpope/vim-repeat'  

"matchit.vim
Plugin 'geoffharcourt/vim-matchit'

"added fugitive 
Plugin 'tpope/vim-fugitive'  

"added ultiships
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" added python-mode
Plugin 'python-mode/python-mode'

call vundle#end()  		" required


" jk as escape
:imap jk <Esc>
:cmap jk <Esc>

"emmet trigger
let g:user_emmet_leader_key='<C-Z>'



" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"


"auto-indent on save. Refer: https://coderwall.com/p/phy6cg/vim-auto-indent-on-save
"augroup autoindent
"    au!
"    autocmd BufWritePre * :normal migg=G`i
"augroup End

"copy to clipboard macro
let @c='"+y'
