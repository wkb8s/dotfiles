""""""""""""""""""
" Initialization "
""""""""""""""""""
call plug#begin('~/.vim/plugged')

" completion and linting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rhysd/vim-clang-format'
Plug 'kana/vim-operator-user'
Plug 'tribela/vim-transparent'
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

call plug#end()

"""""""""""
" Editing "
"""""""""""
set shiftwidth=4
set clipboard=unnamed
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.c setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.cc setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.cpp setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.h setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.hh setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.j2 setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.erb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.hs setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.dart setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.sh setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

""""""""""""""""
" key bindings "
""""""""""""""""

" basic bindings
let mapleader="\<Space>"
inoremap <silent> jj <Esc>
nnoremap ; :

" cursor control
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
nnoremap <Leader>q :q!<CR>

" toggle
nnoremap <silent> <Leader>tn :NERDTreeToggle<CR>
nnoremap <silent> <Leader>tt :TagbarToggle<CR>

" highlight
nnoremap <Leader>z :noh<CR>

" brackets completion
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

" tab
" nnoremap <Leader>t :tabnew<CR>
map <F3> gT
map <F4> gt

" search
set ignorecase
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

" clang format
nnoremap <Leader>c :ClangFormat<CR>

" ctags
noremap <Leader>b <C-t>
noremap <Leader>j <C-]>
set tags=.tags

""""""
" UI "
""""""
set relativenumber
set cursorline
set virtualedit=onemore
set showmatch
set termguicolors

" set list listchars=space:･
autocmd BufWritePre * :%s/\s\+$//e

" status line
let g:lightline = {'colorscheme': 'onedark'}

" colors
colorscheme onedark

" highlight Normal ctermbg=NONE guibg=NONE
" highlight NonText ctermbg=NONE guibg=NONE
" highlight LineNr ctermbg=NONE guibg=NONE
" highlight Folded ctermbg=NONE guibg=NONE
" highlight EndOfBuffer ctermbg=NONE guibg=NONE
" highlight Comment ctermbg=NONE guibg=NONE
" highlight Statement ctermbg=NONE guibg=NONE
" highlight Identifier ctermbg=NONE guibg=NONE
" highlight Preproc ctermbg=NONE guibg=NONE
" highlight Type ctermbg=NONE guibg=NONE
" highlight Constant ctermbg=NONE guibg=NONE
" highlight Special ctermbg=NONE guibg=NONE
" highlight Conditional ctermbg=NONE guibg=NONE
" highlight Repeat ctermbg=NONE guibg=NONE
" highlight Exception ctermbg=NONE guibg=NONE

" hide tmux bar
" if !has('gui_running') && $TMUX !=# ''
"     augroup Tmux
"         autocmd!
"         autocmd VimEnter,VimLeave * silent !tmux set status
"     augroup END
" endif

" status bar
let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let s:palette.inactive.middle = s:palette.normal.middle
let s:palette.tabline.middle = s:palette.normal.middle

""""""""""
" CoCvim "
""""""""""
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

""""""""""
" format "
""""""""""
let g:clang_format#detect_style_file=1

""""""""
" Misc "
""""""""

" fzf
let g:fzf_action = {
  \ 'enter': 'tab split'}
