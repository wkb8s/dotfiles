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
" Plug 'joshdick/onedark.vim'
Plug 'Yggdroot/indentLine'
Plug 'lervag/vimtex'
Plug 'mcchrish/nnn.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-rooter'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-expand-region'
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
nnoremap <leader><leader> V
nnoremap <CR> G
nnoremap <C-h> gg
nnoremap ; :
nnoremap : ;

" cursor control
inoremap <C-b> <Left>
inoremap <C-f> <Right>
nnoremap j gjzz
nnoremap k gkzz
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" file control
nnoremap <Leader>a ggVG
nnoremap <Leader>s :w<CR>

nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>

" highlight
nnoremap <Leader>z :noh<CR>

" tab
" nnoremap <Leader>t :tabnew<CR>
map <F3> gT
map <F4> gt
nnoremap <C-j> gT
nnoremap <C-k> gt

" search
set ignorecase
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" split views
nnoremap <Leader>- :split<CR>
nnoremap <Leader>\ :vsplit<CR>
nnoremap <leader>j <C-w>j
nnoremap <leader>h <C-w>h
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" fzf mappings
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <leader>r :Rg<CR>

" ctags
noremap <Leader>b <C-t>
noremap <Leader>j :lcd %:h<CR><C-]>
set tags=.tags

" clang format
augroup save_clang
    autocmd!
    autocmd BufWritePost *.[ch] ClangFormat
augroup END

""""""
" UI "
""""""
set number
set relativenumber
set cursorline
set virtualedit=onemore
set showmatch
set termguicolors

" set list listchars=space:･
autocmd BufWritePre * :%s/\s\+$//e

" colors
colorscheme nord

" hide tmux bar
" if !has('gui_running') && $TMUX !=# ''
"     augroup Tmux
"         autocmd!
"         autocmd VimEnter,VimLeave * silent !tmux set status
"     augroup END
" endif

" status bar
" let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
" let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
" let s:palette.inactive.middle = s:palette.normal.middle
" let s:palette.tabline.middle = s:palette.normal.middle
let g:lightline = {
   \ 'colorscheme': 'nord',
   \ }

""""""""""
" CoCvim "
""""""""""
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"""""""""
" latex "
"""""""""
let g:vimtex_compiler_latexmk = { 'continuous' : 0 }
let g:vimtex_quickfix_open_on_warning = 0
let g:tex_conceal = ''
function! _DoAstyle()
    silent! !latexmk "%:t"
    silent! !latexmk -c "%:t"
    echo "compile finished!"
endfunction
command! DoAstyle call _DoAstyle()
augroup save_compile_and_clean
    autocmd!
    autocmd BufWritePost *.tex :DoAstyle
augroup END

""""""""""
" format "
""""""""""
let g:clang_format#detect_style_file=1

""""""""
" Plug "
""""""""

" fzf
let g:fzf_action = {
  \ 'enter': 'tab split'}

" nerdtree
nnoremap <silent> <Leader>tn :NERDTreeToggle<CR>

" nnn
nnoremap <leader>n :NnnPicker %:p:h<CR>
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-s>': 'split',
      \ '<c-v>': 'vsplit' }

" vim-gitgutter
set updatetime=100

" vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"""""""""""""
" Functions "
"""""""""""""

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()
