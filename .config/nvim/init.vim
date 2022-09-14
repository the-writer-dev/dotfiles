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
set guicursor=
set nocompatible
set hidden
set encoding=utf-8

" Languages
" - Indentations
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2                                                   

set rtp +=~/.vim
" Plugins
call plug#begin()
Plug 'jiangmiao/auto-pairs' "Matching brakets

Plug 'preservim/nerdcommenter' "NerdCommenter
Plug 'preservim/nerdtree' " NerdTree
Plug 'itchyny/lightline.vim'

" Appearances
Plug 'EdenEast/nightfox.nvim' 
Plug 'jacoborus/tender.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons' " Developer Icons

" Languages
Plug 'fatih/vim-go'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " Fuzzy Search

Plug 'airblade/vim-gitgutter/'
Plug 'zivyangll/git-blame.vim'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

Plug 'jlanzarotta/bufexplorer'
Plug 'mhinz/vim-startify'

Plug 'wakatime/vim-wakatime'
call plug#end()

:colorscheme codedark 

" Flutter
let g:dart_format_on_save = 1
let g:dartfmt_options = ['--fix', '--line-length 120']

" Go
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
" Go - Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

let g:airline_powerline_fonts = 1
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

let g:CtrlSpaceDefaultMappingKey = "<C-space> "

nmap <SPACE> <Nop>
let mapleader=" "

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-o> coc#refresh()

inoremap <silent><expr> <Tab>
	  \ coc#pum#visible() ? coc#pum#next(1) :
	  \ check_back_space() ? "\<Tab>" :
	  \ coc#refresh()

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

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
nnoremap <silent>K :call <SID>show_documentation()<CR>

" Git balme
nnoremap <leader>g :<C-u>call gitblame#echo()<CR>

" Search
" `SPC b e` - open buf explorer to delete multiple buffers at once like Emacs
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
" `SPc l d` - delete sessions
nnoremap <leader>ld :SDelete<CR>

nmap <leader>ff :Files<CR>
nmap <leader>rg :Rg<CR>
nmap <leader>bi :Buffers<CR>

