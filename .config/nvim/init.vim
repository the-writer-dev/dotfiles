set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set nohlsearch
set cursorline
set clipboard+=unnamedplus
set modifiable


call plug#begin()
Plug 'jiangmiao/auto-pairs' "Matching brakets

Plug 'preservim/nerdcommenter' "NerdCommenter
Plug 'preservim/nerdtree' " NerdTree
Plug 'vim-airline/vim-airline' " Status bar

Plug 'rafi/awesome-vim-colorschemes' " Color Schemes
Plug 'ryanoasis/vim-devicons' " Developer Icons

Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " Fuzzy Search
Plug 'jlanzarotta/bufexplorer'

Plug 'airblade/vim-gitgutter/'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'thaerkh/vim-workspace'
Plug 'vim-ctrlspace/vim-ctrlspace'

Plug 'mhinz/vim-startify'
call plug#end()

:colorscheme PaperColor

let g:airline_powerline_fonts = 1
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
nmap <silent> \gs :split<CR><Plug>(coc-definition)
nmap <silent> \gv :vsplit<CR><Plug>(coc-definition)

" rename
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Search
nnoremap <leader>b :ls<cr>:b<space>
nnoremap <leader>v :ls<cr>:vsp<space>\|<space>b<space>
nnoremap <leader>s :ls<cr>:sp<space>\|<space>b<space>
nnoremap <leader>bd :ls<cr>:bd<space>

" Nerdtree
nnoremap <leader>pp :NERDTreeToggle<CR>
nnoremap <leader>P :NERDTreeFind<CR>

" Buffer
nnoremap <leader>j :bprevious<CR>
nnoremap <leader>k :bnext<CR>

" Start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | endif
function! OpenTerminalVertically()
  vsplit term://zsh
endfunction

au BufEnter * if &buftype == 'terminal' | endif
function! OpenTerminalHorizontally()
  split term://zsh
endfunction

nmap <leader>t :call OpenTerminalVertically()//zsh<CR>
nmap <leader>T :call OpenTerminalHorizontally()//zsh<CR>
tnoremap <Esc> <C-\><C-n>

" resizing the window horizontally
nmap <leader>+ :vertical res +10<CR>
nmap <leader>- :vertical res -10<CR>

" resizing the window vertically
nmap <leader>w+ :res +10<CR>
nmap <leader>w- :res -10<CR>

" Clipboard
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy
nnoremap <leader>p "+p

" Navigating panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" `SPC l s` - save current session
nnoremap <leader>ls :SSave<CR>
" `SPC l l` - list sessions / switch to different project
nnoremap <leader>ll :SClose<CR>

" Telescope
"nnoremap <leader>ff <cmd>Telescope find_files<cr>
"nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"nnoremap <leader>fb <cmd>Telescope buffers<cr>

nmap <leader>ff :Files<CR>
nmap <leader>rg :Rg<CR>
nmap <leader>bi :Buffers<CR>


"FZF Buffer Delete
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))
