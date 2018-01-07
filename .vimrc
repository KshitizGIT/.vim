set nocompatible
set encoding=utf-8

syntax enable
filetype on

set relativenumber
set number

filetype plugin indent on      	" required 
" map <F6> to toggle NERDTree
nmap <F6> :NERDTreeToggle<CR>

" map CTRL+J to add new line in normal mode
nnoremap <NL> A <CR><ESC>

set expandtab
set nowrap
set shiftwidth=4
set softtabstop=4
set tabstop=4


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

" syntastic.vim
Plugin 'vim-syntastic/syntastic'

" added python-mode
"Plugin 'python-mode/python-mode'

call vundle#end()  		" required


" jk as escape
:imap jk <Esc>
:cmap jk <Esc>

" Automatic reloading of .vimrc files
autocmd! bufwritepost .vimrc source % 

" Better copy and paste
set pastetoggle=<F2>
set clipboard=unnamed

" Rebind <leader> key 
let mapleader = ","

" Quicksave command 
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR> " Quit current window
noremap <Leader>E :qa!<CR>  " Quit all window

" easier moving between tabs  
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

"map sort function to a key  
vnoremap <Leader>s :sort<CR> 

"easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation 

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

"YouCompleteMe settings
let g:ycm_python_binary_path='python'

"Syntastic Recommended Settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
