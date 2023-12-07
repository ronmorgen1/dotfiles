"------------------------------------------------------------
" General
"------------------------------------------------------------

" Encoding
set encoding=utf8
set fileencoding=utf8
set fileencodings=utf8
set ttyfast

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Enable hidden buffers
set hidden 

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable swap & backup files
set noswapfile
set nobackup
set nowritebackup

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/usr/local/bin/zsh
endif

" Hide scrollbars and mute annoying sound on errors
if has('gui_running')
  set guioptions-=e
  set guioptions-=L
  set guioptions-=r
  set guioptions-=T
  set guioptions-=T
  set guitablabel=%M\ %t
  set shortmess+=c
  set t_Co=256
endif

" Clipboard
if has('unnamedplus')
  set clipboard=unnamedplus,unnamed
else
  set clipboard+=unnamed
endif

" Add a bit extra margin to the left
set foldcolumn=1

"------------------------------------------------------------
" Visuals
"------------------------------------------------------------

set fillchars+=eob:\ ,fold:\ ,vert:\│
set number " Show line numbers
set ruler " Show cursor position


" Enable syntax highlighting

syntax enable
set termguicolors

" Set colorscheme 
colorscheme catppuccin_frappe

set background=dark

"------------------------------------------------------------
" Mappings
"------------------------------------------------------------

let mapleader = "\\"

" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

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

"" Split
noremap <Leader>sh :<C-u>split<CR>
noremap <Leader>sv :<C-u>vsplit<CR>

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

" Yank/Cut to the end of line
nnoremap Y y$
nnoremap D d$

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Insert blank lines above/below
nnoremap <silent> ]<Space> :<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "'[-1"<CR>
nnoremap <silent> [<Space> :<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "']+1"<CR>

" Quick command mode
nnoremap <CR> :

" Toggle pastemode
nnoremap <silent> <Leader>tp :setlocal paste!<CR>

" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"------------------------------------------------------------
" Abbreviations
"------------------------------------------------------------

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

"------------------------------------------------------------
" Autocommands
"------------------------------------------------------------

"Restore cursor position
augroup restore_pos | au!
    au BufWinEnter *
                \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
                \ |   exe 'normal! g`"zz'
                \ | endif
augroup end

