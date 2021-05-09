" syntax on

" turn on mouse in all modes
set mouse=a
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set autoindent
set nowrap
set smartcase
set noswapfile
set incsearch
set showcmd
set autoread
set virtualedit=onemore "cursor goes one more position than the usual
" set whichwrap+=<,>,[,],l,h

vertical resize 30 

" turn hybrid line numbers on
set number relativenumber
set nu rnu
set colorcolumn=80
"set termguicolors
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')
" themes
Plug 'gruvbox-community/gruvbox'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ervandew/supertab' 
Plug 'Valloric/YouCompleteMe'
Plug 'preservim/nerdtree'
Plug 'git@github.com:SirVer/ultisnips.git'
Plug 'honza/vim-snippets'
" Commenting
Plug 'https://tpope.io/vim/commentary.git'
Plug 'tpope/vim-surround'
" adding repeatability(dot command) for vim-surrond
Plug 'https://tpope.io/vim/repeat.git'
" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'mbbill/undotree'
" Status bar
" Plug 'vim-airline/vim-airline'
call plug#end()

" palenight / gruvbox
colorscheme gruvbox
set background=dark
" set t_Co=256

" using vim-cpp-modern sytanx highlighting

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

let g:mapleader = "\<space>"

inoremap {<CR> {<CR>}<Esc>O
" inoremap <C-space> <C-o>l

" Split navigation shortcuts
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Split opening shortcuts
nnoremap <leader>h :split<Space>
nnoremap <leader>v :vsplit<Space>

" Fix splitting 
set splitbelow splitright

" Better command mode autocompletion
set wildmode=longest,list,full

" This is to copy to CLipboard.
noremap <Leader>Y "*y
noremap <Leader>P "*p
noremap <Leader>y "+y
noremap <Leader>p "+p

" Overwrite /* */ with // for c,cpp
augroup comments
	autocmd!
	autocmd FileType c,cpp setlocal commentstring=//\ %s
augroup END

" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")

" Shortcut for goto definition
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

set autowrite 
nnoremap <C-c> :!g++ -std=c++17 % -Wall -g -o %.out && ./%.out < input.txt > output.txt

"nnoremap <C-c> :!g++ -o  %:r.out % -std=c++11<Enter>
"nnoremap <C-x> :!./%:r.out

" Vertically center document when entering insert mode
" autocmd InsertEnter * norm zz
 
"inoremap { {}<Left>
"inoremap {{ {
" inoremap {} {}
"inoremap }} }
"inoremap [ []<Left>
"inoremap ( ()<Left>
