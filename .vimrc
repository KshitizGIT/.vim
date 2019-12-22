set nocompatible
set relativenumber
set number

" map <F6> to toggle netrw
nmap <F6> :Vexplore<CR>

set nowrap
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set hlsearch


call plug#begin('~/.vim/plugged')
" large file plugin
Plug 'vim-scripts/LargeFile'
" added solarized
Plug 'rafi/awesome-vim-colorschemes' 
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
" vim-tmux-navigator
Plug 'christoomey/vim-tmux-navigator' 
" chrisbra/csv.vim
Plug 'chrisbra/csv.vim', {'on' : 'CSVInit'}
"vim-instant-markdown
Plug 'suan/vim-instant-markdown' , {'for': 'markdown'}
"jedi vim
Plug 'davidhalter/jedi-vim'
" typescript syntax highlighting
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript'}
" vim-jsx-pretty jsx syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'
" vim javascript autocomplet
Plug 'carlitux/deoplete-ternjs', {'do': 'npm install -g tern'}
"neovim specific installation
"
if v:version>= 800 || has('nvim')
    "deoplete
    if has('nvim')
        Plug 'Shougo/deoplete.nvim' , { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif
    "neomake
     Plug 'neomake/neomake'
    "deoplete typescript port
    Plug 'mhartington/nvim-typescript', {'for': 'typescript' }
    " deoplete jedi
    Plug 'zchee/deoplete-jedi'
else
    " added YouCompleteMe
    Plug 'Valloric/YouCompleteMe'
    " syntastic.vim
    Plug 'vim-syntastic/syntastic' 
endif
call plug#end()

filetype off
filetype plugin indent on	" required 
syntax enable
" jk as escape
:imap jk <Esc>
:cmap jk <Esc>

" Automatic reloading of .vimrc files
autocmd! BufwritePost .vimrc,init.vim source % 

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

" Quicksave command 
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR> " Quit current window
noremap <Leader>E :qa!<CR>  " Quit all window

" easier moving between tabs  
map <Leader>p <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

"map sort function to a key  
vnoremap <Leader>s :sort<CR> 

"map leader a to find under cursor
noremap <Leader>a :Ack -w <cword><CR>
"easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation 
"map ctrl-, to search ctrl p search only current directory
noremap <C-t> :CtrlPCurWD<CR>
"emmet trigger
let g:user_emmet_leader_key='<C-Z>'


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

"copy to clipboard macro
let @c='ggVGy'''''
if v:version >=800 || has('nvim')
    "deoplete settings
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#sources#jedi#show_docstring = 1
    "disable jedi vims autocompletion. Use deoplete-jedi autocomplete
    let g:jedi#completions_enabled = 0
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    "neomake settings
    call neomake#configure#automake('rw', 1000)
else
    let g:syntastic_markdown_mdl_exec = 'markdownlint'
    let g:syntastic_markdown_mdl_args = ''
endif
nnoremap <Leader>gd :YcmCompleter GoTo<CR>

"if silver search if available
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

"vim markdown preview settings
let g:instant_markdown_autostart = 0
let g:instant_markdown_slow = 1
"large file 100MB
let g:LargeFile = 100
let g:netrw_preview = 1

" default color scheme
colorscheme OceanicNext
"include custom commands
source ~/.vim/commands.vim
