:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

set clipboard+=unnamedplus

call plug#begin()
Plug 'jiangmiao/auto-pairs' "Matching brakets

Plug 'preservim/nerdcommenter' "NerdCommenter
Plug 'preservim/nerdtree' " NerdTree
Plug 'vim-airline/vim-airline' " Status bar

Plug 'rafi/awesome-vim-colorschemes' " Color Schemes
Plug 'ryanoasis/vim-devicons' " Developer Icons
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " Fuzzy Search

Plug 'nvim-lua/plenary.nvim'
Plug 'TimUntersberger/neogit'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'thaerkh/vim-workspace'
Plug 'vim-ctrlspace/vim-ctrlspace'

call plug#end()


:colorscheme happy_hacking 

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

nmap <SPACE> <Nop>
let mapleader=" "

" Use tab for auto completion
imap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Code navigation.
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
" rename
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Search
nmap <leader><Space> :Files<CR>
nmap <leader>rg :Rg<CR>

" Nerdtree
nmap <leader>f :NERDTreeToggle<CR>
nmap <leader>F :NERDTreeFind<CR>

" Buffer
nnoremap <leader>j :bprev<CR>
nnoremap <leader>k :bnext<CR>

" Open Neogit
nnoremap <leader>g :Neogit<CR>

" Start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | endif
function! OpenTerminal()
  vsplit term://zsh
endfunction

nmap <leader>t :call OpenTerminal()//zsh<CR>
tnoremap <Esc> <C-\><C-n>

" resizing the window
nmap <leader>+ :vertical res +10<CR>
nmap <leader>- :vertical res -10<CR>

" Clipboard
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy
nnoremap <leader>p "+p

" Navigating panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
