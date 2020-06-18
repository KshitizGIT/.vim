set nocompatible
set relativenumber
set number

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
"add auto-pairs
Plug 'jiangmiao/auto-pairs'
"add preetier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"add nerdtree
Plug 'preservim/nerdtree'
"matchit.vim
Plug 'geoffharcourt/vim-matchit' 
"added fugitive 
Plug 'tpope/vim-fugitive'
" vim-tmux-navigator
Plug 'christoomey/vim-tmux-navigator' 
" chrisbra/csv.vim
Plug 'chrisbra/csv.vim', {'on' : 'CSVInit'}
" iamcco/markdown-preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" typescript syntax highlighting
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript'}
" vim-jsx-pretty jsx syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'

if v:version>= 800 || has('nvim')
    "neomake
     Plug 'neomake/neomake'
else
    " syntastic.vim
    Plug 'vim-syntastic/syntastic' 
endif
"Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" added fzf.vim
Plug 'junegunn/fzf', {'do': './install --bin'}
Plug 'junegunn/fzf.vim'
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
noremap <C-p> :Files<CR>
noremap <C-g> :Rg<CR>

"copy to clipboard macro
let @c='ggVGy'''''
if v:version >=800 || has('nvim')
    "neomake settings
    call neomake#configure#automake('rw', 1000)
else
    let g:syntastic_markdown_mdl_exec = 'markdownlint'
    let g:syntastic_markdown_mdl_args = ''
endif

"if silver search if available
if executable('rg')   
    let g:ackprg = 'rg --vimgrep --no-heading'
elseif executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

"large file 100MB
let g:LargeFile = 100

map <F6> :NERDTreeToggle<CR>
"begin coc settings
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"end coc settings

" default color scheme
colorscheme OceanicNext

"include custom commands
source ~/.vim/commands.vim
