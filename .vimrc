set nocompatible
set relativenumber
set number

" map <F6> to toggle NERDTree
nmap <F6> :NERDTreeToggle<CR>

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4


call plug#begin('~/.vim/plugged')
" added nerdtree
Plug 'scrooloose/nerdtree' , { 'on': 'NERDTreeToggle' }

" added emmet-vim
Plug 'mattn/emmet-vim'

" added solarized
Plug 'altercation/vim-colors-solarized'

" added YouCompleteMe
Plug 'Valloric/YouCompleteMe'

" added ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'

" added ack.vim
Plug 'mileszs/ack.vim'

" added vim-airline
Plug 'vim-airline/vim-airline'

" added vim-airline-themes
Plug 'vim-airline/vim-airline-themes'

"added vim-surround

Plug 'tpope/vim-surround'

"added vim-repeat
Plug 'tpope/vim-repeat'  

"matchit.vim
Plug 'geoffharcourt/vim-matchit'

"added fugitive 
Plug 'tpope/vim-fugitive'  

"added ultiships
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" syntastic.vim
Plug 'vim-syntastic/syntastic'

" vim-tmux-navigator
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

filetype off
filetype plugin indent on	" required 
syntax enable
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

" easy open .vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>

" show invisibles toggle
nmap <leader>l :set list!<CR>

"Use the symbols as TextMate for tabstops and EOLS
set listchars=tab:▸\ ,eol:¬


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

"map leader a to find under cursor
noremap <Leader>a :Ack -w <cword><CR>
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

"if silver search if available
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
