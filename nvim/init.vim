""""""""""""""""""
" Initialization "
""""""""""""""""""
call plug#begin('~/.vim/plugged')

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

" tab
nnoremap <Leader>t :tabnew<CR>

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
set number

" colors
colorscheme atom-dark-256

" hide tmux bar
if !has('gui_running') && $TMUX !=# ''
    augroup Tmux
        autocmd!
        autocmd VimEnter,VimLeave * silent !tmux set status
    augroup END
endif

""""""""
" Misc "
""""""""

" fzf
let g:fzf_action = {
  \ 'enter': 'tab split'}
