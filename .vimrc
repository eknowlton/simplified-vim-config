call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'francoiscabrol/ranger.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'liuchengxu/vim-which-key'
Plug 'ruanyl/vim-gh-line'

call plug#end()

set exrc
set secure

colorscheme monokai

set encoding=UTF-8

set number
set relativenumber
set cursorline
set undofile
set autoread
set expandtab
set smartindent
set nocompatible
set splitbelow
set splitright

autocmd FileType crontab setlocal nobackup nowritebackup
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType json setlocal ts=2 sts=2 sw=2
autocmd FileType zsh setlocal ts=2 sts=2 sw=2
autocmd FileType sh setlocal ts=2 sts=2 sw=2
autocmd FileType c setlocal ts=4 sts=4 sw=4
autocmd FileType typescript setlocal ts=2 sts=2 sw=2
autocmd FileType typescript.tsx setlocal ts=2 sts=2 sw=2
autocmd FileType ruby setlocal ts=2 sts=2 sw=2
autocmd FileType php setlocal ts=4 sts=4 sw=4
autocmd FileType ccpp setlocal ts=4 sts=4 sw=4
autocmd FileType xml setlocal ts=2 sts=2 sw=2
autocmd FileType json syntax match Comment +\/\/.\+$+

autocmd BufEnter *.tsx set filetype=typescript.jsx
autocmd BufEnter *.jsx set filetype=javascript.jsx

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

inoremap jk <Esc>
tnoremap <Esc> <C-\><C-n>

set clipboard=unnamedplus

let mapleader = "\<Space>"
let maplocalleader = ","

let g:which_key_map = {}

let g:ranger_map_keys = 0 " Ranger auto maps this to <leader>f

let g:which_key_map.r = ['Ranger', 'Ranger File Browser']

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
        if (index(['vim', 'help'], &filetype) >= 0)
                execute 'h '.expand('<cword>')
        else
                call CocAction('doHover')
        endif
endfunction

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

"----- Buffers
let g:which_key_map.b = { 'name' : 'Buffers',
               \ 'n' : ['BufferNext', 'Next Buffer'],
               \ 'p' : ['BufferPrevious', 'Previous Buffer'],
               \ }

let g:which_key_map.r = ['Ranger', 'Ranger File Browser']

let g:which_key_map.f = { 'name' : 'Files',
               \ 'f' : ['Files', 'Find Files FZF'],
               \ 'g' : ['GFiles', 'Find GIT Files FZF'],
               \ }

let g:which_key_map.w = { 'name' : 'Windows',
	       \ 'd' : ['close', 'Close Window'],
	       \ 's' : ['split', 'Horizontal Split'],
	       \ 'v' : ['vsplit', 'Vertical Split'],
	       \ 'h' : ['<C-W>h', 'Move Left'],
	       \ 'l' : ['<C-W>l', 'Move Right'],
	       \ 'j' : ['<C-W>j', 'Move Down'],
	       \ 'k' : ['<C-W>k', 'Move Up'],
	       \ 't' : ['call MaximizeToggle()', 'Close Others'],
	       \ '=': ['wincmd =', 'Resize Equally'],
	       \ }

call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual ','<CR>
