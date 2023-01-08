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
scriptencoding utf-8

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

" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin(expand('~/.vim/plugged'))

    Plug 'preservim/nerdtree'
    Plug 'dense-analysis/ale'
    Plug 'mechatroner/rainbow_csv'
    Plug 'godlygeek/tabular'
    Plug 'vim-scripts/grep.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'mhinz/vim-startify'
    Plug 'Yggdroot/indentLine'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'ryanoasis/vim-devicons'
    Plug 'sainnhe/everforest'
    Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
    Plug 'gelguy/wilder.nvim'
    Plug 'xolox/vim-session'
    Plug 'xolox/vim-misc'
    Plug 'github/copilot.vim'

call plug#end()

filetype plugin indent on

" -----------------------------------------------------------------------------
" Color Settings
" -----------------------------------------------------------------------------

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
" Plugins Settings
" -----------------------------------------------------------------------------

" preservim/nerdtree
let g:NERDTreeChDirMode            = 2
let g:NERDTreeIgnore               = ['node_modules','\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder            = ['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeMinimalUI            = 0
let g:nerdtree_tabs_focus_on_files = 1
let g:NERDTreeMapOpenInTabSilent   = '<RightMouse>'
let g:NERDTreeWinSize              = 60
let g:NERDTreeShowHidden           = 1
let g:NERDTreeWinPos               = 'right'
let NERDTreeQuitOnOpen             = 1
let NERDTreeHijackNetrw            = 0
let g:loaded_netrw                 = 1
let g:loaded_netrwPlugin           = 1

" After a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*node_modules/

nnoremap <silent> <C-f> :call NERDTreeToggleAndFind()<CR>
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

" dense-analysis/ale
let g:ale_linters = {
	\'json': ['jq'],
	\'yaml': ['yamllint'],
	\'sql' : ['sqlint'],
	\'bash': ['shfmt']
\}

let g:ale_fixers = {
    \'*'   : ['remove_trailing_lines', 'trim_whitespace'],
    \'json': ['jq'],
    \'yaml': ['yamlfix'],
    \'sql' : ['sqlfmt'],
    \'bash': ['shfmt']
\}

let g:ale_fix_on_save = 1

highlight ALEError cterm=underline
highlight ALEWarning cterm=underline

" junegunn/fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

" airblade/vim-gitgutter
let g:gitgutter_max_signs             = 5000
let g:gitgutter_sign_removed          = '✗'
let g:gitgutter_sign_added            = '✓'
let g:gitgutter_map_keys              = 0
let g:gitgutter_diff_args             = '--ignore-space-at-eol'

" tpope/vim-fugitive
nnoremap <Leader>gb :Git blame <CR>

" mhinz/vim-startify
let g:ascii = [
    \ ' __     _____ __  __',
    \ ' \ \   / /_ _|  \/  |',
    \ '  \ \ / / | || |\/| |',
    \ '   \ V /  | || |  | |',
    \ '    \_/  |___|_|  |_|',
    \ ''
    \]
let g:startify_custom_header = g:ascii
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_files_number = 5
let g:startify_bookmarks = [
        \ { 'a': '~/.dotfiles' },
        \ { 'd': '~/pgy-projects/DBT_piperdb' },
        \ { 'c': '~/pgy-projects/config' },
        \ ]
let g:startify_lists = [
        \ { 'header': ['   Most Recently Used'], 'type': 'files' },
        \ { 'header': ['   Sessions'],           'type': 'sessions' },
        \ { 'header': ['   Bookmarks'],          'type': 'bookmarks' },
        \ ]

" vim-airline/vim-airline
let g:airline_theme                               = 'everforest'
let g:airline_powerline_fonts                     = 1
let g:airline_left_sep                            = ''
let g:airline_left_alt_sep                        = ''
let g:airline_right_sep                           = ''
let g:airline_right_alt_sep                       = ''
let g:airline_detect_whitespace                   = 1
let g:airline_section_c                           = airline#section#create(['%{fnamemodify(expand("%"), ":~:.")}'])
let g:airline_section_y                           = '%{fnamemodify(getcwd(), ":t")}'
let g:airline_extensions                          = ['branch']
let g:airline_section_z                           = '%3p%% %3l/%L:%3v'

" Yggdroot/indentLine
let g:indentLine_enabled       = 1
let g:indentLine_concealcursor = ''
let g:indentLine_char          = '┆'
let g:indentLine_faster        = 1

" gelguy/wilder.nvim
call wilder#setup({'modes': [':', '/', '?']})

let s:highlighters = [
        \ wilder#pcre2_highlighter(),
        \ wilder#basic_highlighter(),
        \ ]

call wilder#set_option('renderer', wilder#renderer_mux({
      \ ':': wilder#popupmenu_renderer({
      \   'highlighter': s:highlighters,
      \ }),
      \ '/': wilder#wildmenu_renderer({
      \   'highlighter': s:highlighters,
      \ }),
      \ }))

" xolox/vim-session
let g:session_command_aliases = 1
let g:session_autosave = 'no'
let g:session_autoload = 'no'
nnoremap <silent> <Leader>seo :SessionOpen<CR>
nnoremap <silent> <Leader>sev :SessionView<CR>
nnoremap <silent> <Leader>ses :SessionSave<CR>

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

function! NERDTreeToggleAndFind()
    if (exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1)
      execute ':NERDTreeClose'
    else
      execute ':NERDTreeFind'
    endif
endfunction
