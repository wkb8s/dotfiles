""""""""""""""""""
" Initialization "
""""""""""""""""""
call plug#begin('~/.vim/plugged')

" completion and linting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

"""""""""""
" Editing "
"""""""""""
set shiftwidth=4

set clipboard=unnamed

""""""""""""""""
" key bindings "
""""""""""""""""

" basic bindings
let mapleader="\<Space>"
inoremap <silent> jj <Esc>
nnoremap ; :

" cursor control
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap <Leader>h ^
nnoremap <Leader>l $

" file control
nnoremap <Leader>a ggVG
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" brackets completion
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

" tab
nnoremap <Leader>t :tabnew<CR>

" search
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" split views
nnoremap <Leader>- :split<CR>
nnoremap <Leader>\| :vsplit<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" fzf mappings
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <leader>r :Rg<CR>

""""""
" UI "
""""""
set relativenumber

" colors
colorscheme atom-dark-256

" hide tmux bar
if !has('gui_running') && $TMUX !=# ''
    augroup Tmux
        autocmd!
        autocmd VimEnter,VimLeave * silent !tmux set status
    augroup END
endif

""""""""""
" CoCvim "
""""""""""
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

""""""""
" Misc "
""""""""

" fzf
let g:fzf_action = {
  \ 'enter': 'tab split'}
