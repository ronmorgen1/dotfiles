" -----------------------------------------------------------------------------
" Basic Settings
" -----------------------------------------------------------------------------

set hidden
set number
set wrap
set showmatch
set ruler
set showcmd
set lazyredraw
set scrolloff=8
set cursorline
set nocursorcolumn
set fileformats=unix,dos,mac
set formatoptions-=ro
set hlsearch
set incsearch
set smartcase
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set nobackup
set noundofile
set noswapfile
set ttymouse=sgr
set encoding=utf8

" Hide scrollbars and mute annoying sound on errors
if has('gui_running')
  set guioptions-=r
  set guioptions-=L
  set guioptions-=T
  set guioptions-=e
  set shortmess+=c
endif

" Clipboard
if has('unnamedplus')
  set clipboard=unnamedplus,unnamed
else
  set clipboard+=unnamed
endif

" Syntax highlighting
syntax on

if has('termguicolors')
  set termguicolors
endif

let g:everforest_better_performance = 1
let g:everforest_background = 'soft'

" Color scheme
colorscheme everforest
set background=dark

if $COLORTERM ==# 'gnome-terminal'
  set term=gnome-256color
else
  if $TERM ==# 'xterm'
    set term=xterm-256color
  endif
endif

" Changing cursor and highlighting line when in insert mode
autocmd InsertEnter,InsertLeave * set cul!
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" -----------------------------------------------------------------------------
" Keys (re)Mappings
" -----------------------------------------------------------------------------

" Be the change you want to see
nnoremap <Left>  <Nop>
nnoremap <Right> <Nop>
nnoremap <Up>    <Nop>
nnoremap <Down>  <Nop>

" Move half page faster
nnoremap <Leader>d  <C-d>
nnoremap <Leader>u  <C-u>

" Move to the start/end of line
nnoremap H ^
nnoremap L $

" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Insert mode shortcut
inoremap <C-h> <BS>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>

" Command mode shortcut
cnoremap <C-h> <BS>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Delete>

" Escaping
inoremap jj <Esc>
cnoremap jj <C-c>
vnoremap v <Esc>

" Buffers
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Windows
nnoremap <silent> ]w  <C-W>w
nnoremap <silent> [w  <C-W>W

" Splits
nnoremap <Leader>sh <C-W>s
nnoremap <Leader>sv <C-W>v
nnoremap <Leader>s= <C-W>=

" Tabs
nnoremap <silent> ]t :tabnext<CR>
nnoremap <silent> [t :tabprev<CR>
nnoremap <Leader>te :tabedit<Space>

" Move a line of text
nnoremap <C-j> mz:m+<CR>`z
nnoremap <C-k> mz:m-2<CR>`z

" Terminal
if has('nvim') || has('terminal')
  tnoremap <Leader>q <C-w><C-C><C-w>c<cr>
  tnoremap <C-h> <C-w>h
  tnoremap <C-j> <C-w>j
  tnoremap <C-k> <C-w>k
  tnoremap <C-l> <C-w>l
  nnoremap <silent> <Leader>' :terminal<CR>
else
  nnoremap <silent> <Leader>' :shell<CR>
endif

" Redo
nnoremap U <C-r>

" Quick command mode
nnoremap <CR> :

" Yank/Cut to the end of line
nnoremap Y y$
nnoremap D d$

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Insert blank lines above/below
nnoremap <silent> ]<Space> :<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "'[-1"<CR>
nnoremap <silent> [<Space> :<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "']+1"<CR>

" Search result highlight countermand
nnoremap <silent> <Leader>sc :nohlsearch<CR>

" Toggle pastemode
nnoremap <silent> <Leader>tp :setlocal paste!<CR>

" Reload .vimrc
nnoremap <F12> :source ~/.vimrc <cr>:echom "Reloaded Vim configuration"<cr>

" -----------------------------------------------------------------------------
" Abbreviations
" -----------------------------------------------------------------------------

" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" -----------------------------------------------------------------------------
" Autocmd Rules &
" -----------------------------------------------------------------------------

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

set autoread

" File Templates
augroup FileTemplates
    autocmd BufNewFile *.sh 0r ~/.vim/templates/bash.sh
    autocmd BufNewFile readme.md 0r ~/.vim/templates/readme.md
augroup END

" Reset cursor
augroup RestoreCursorShapeOnExit
  autocmd!
  autocmd VimLeave * set guicursor=a:ver100
augroup END

" -----------------------------------------------------------------------------
" Functions and Commands
" -----------------------------------------------------------------------------


" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction
