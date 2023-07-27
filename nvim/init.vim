""""""""""
" Plugin "
""""""""""
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rhysd/vim-clang-format'
Plug 'kana/vim-operator-user'
Plug 'tribela/vim-transparent'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'lervag/vimtex'
Plug 'mcchrish/nnn.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-commentary'
" Plug 'airblade/vim-rooter'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-expand-region'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'rust-lang/rust.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'brglng/vim-im-select'
Plug 'sheerun/vim-polyglot'
call plug#end()

"""""""""""
" General "
"""""""""""
set noswapfile
set incsearch
set mouse=a

" persistent Undo
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

"""""""""""
" Editing "
"""""""""""

set shiftwidth=4
set clipboard=unnamed
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis

" im-select
let g:im_select_default = 'com.google.inputmethod.Japanese.Roman'

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
let maplocalleader=' '
inoremap <silent> jj <Esc>
nnoremap <leader><leader> V
nnoremap <CR> Gzz
nnoremap <C-h> gg
nnoremap ; :
nnoremap : ;
nnoremap <Leader>, :tabnew $MYVIMRC<CR>

" emacs
map <C-a> <ESC>^
imap <C-a> <ESC>I
map <C-e> <ESC>$
imap <C-e> <ESC>A

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
		autocmd BufWritePost *.cpp ClangFormat
augroup END

""""""
" UI "
""""""
set number
set relativenumber
" set cursorline
set virtualedit=onemore
set showmatch
set termguicolors
" set showtabline=2
set shortmess+=I "disable start menu"

" cursor design
" let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
" let &t_te.="\e[0 q"

" set list listchars=space:･
autocmd BufWritePre * :%s/\s\+$//e

" color
colorscheme nord

" hide tmux status bar
" if !has('gui_running') && $TMUX !=# ''
"     augroup Tmux
"         autocmd!
"         autocmd VimEnter,VimLeave * silent !tmux set status
"     augroup END
" endif

" lightline
let g:lightline = {
 \ 'colorscheme': 'nord',
\ 'separator': { 'left': '', 'right': '' },
\ 'subseparator': { 'left': '', 'right': '' },
 \ 'mode_map': {
    \ 'n' : 'N',
    \ 'i' : 'I',
    \ 'v' : 'V',
    \ 'V' : 'VL',
    \ },
 \ }
set noshowmode

 " \ 'subseparator': { 'right': '' },

""""""""""
" CoCvim "
""""""""""

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"""""""""
" latex "
"""""""""
let g:vimtex_compiler_latexmk = { 'continuous' : 0 }
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_syntax_conceal_disable = 1
" function! _DoAstyle()
"     silent! !latexmk"%:t"
"     silent! !latexmk -c"%:t"
" endfunction
" command! DoAstyle call _DoAstyle()
" augroup save_compile_and_clean
"     autocmd!
"     autocmd BufWritePost *.tex :DoAstyle
" augroup END

""""""""""
" format "
""""""""""

" C
let g:clang_format#detect_style_file = 1

" Rust
let g:rustfmt_autosave = 1

""""""""
" Plug "
""""""""

" vim-commentary
vmap <leader>c gc

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
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '➜'
let g:gitgutter_sign_removed = '✘'

" vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" comfortable-motion
" let g:comfortable_motion_interval = 2400.0 / 60
" let g:comfortable_motion_friction = 100.0
" let g:comfortable_motion_air_drag = 3.0
let g:comfortable_motion_friction = 0.0
let g:comfortable_motion_air_drag = 4.0

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

" restore last cursor place
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
