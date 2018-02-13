set nocompatible


set relativenumber
set number

" map <F6> to toggle NERDTree
nmap <F6> :NERDTreeToggle<CR>

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

" vim-tmux-navigator
Plugin 'christoomey/vim-tmux-navigator'

" csv.vim
"Plugin 'chrisbra/csv.vim'
call vundle#end() " required

filetype off
syntax enable
filetype plugin indent on      	" required 

" jk as escape
:imap jk <Esc>
:cmap jk <Esc>

" Automatic reloading of .vimrc files
autocmd! bufwritepost .vimrc source % 

" Better copy and paste
set pastetoggle=<F2>
set clipboard=unnamedplus 

" Rebind <leader> key 
let mapleader = ","

" solarized options
if &t_Co > 1
    set background=dark
    colorscheme solarized
    let g:airline_theme='solarized'
endif

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

"copy to clipboard macro
let @c='ggVGy'''''

"YouComplete me settings
let g:ycm_python_binary_path='python'
nnoremap <Leader>gd :YcmCompleter GoTo<CR>

"Syntastic Recommended Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
