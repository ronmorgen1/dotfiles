" -----------------------------------------------------------------------------
" Vim-Plug
" -----------------------------------------------------------------------------

let vimplug_exists=expand('~/.vim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

call plug#begin(expand('~/.vim/plugged'))

Plug 'sainnhe/everforest'
Plug 'github/copilot.vim'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'

call plug#end()

filetype plugin indent on

" -----------------------------------------------------------------------------
" Basic Setup
" -----------------------------------------------------------------------------"

let mapleader=' '

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast
set backspace=indent,eol,start
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set hidden
set hlsearch
set incsearch
set ignorecase
set smartcase
set fileformats=unix,dos,mac
set clipboard=unnamedplus

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

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" -----------------------------------------------------------------------------
"" Visual Settings
" -----------------------------------------------------------------------------

syntax on

set ruler
set number

if has('termguicolors')
  set termguicolors
endif

set background=dark

" Available values: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'soft'
let g:everforest_better_performance = 1

colorscheme everforest

" -----------------------------------------------------------------------------
"" Autocmd Rules
" -----------------------------------------------------------------------------

augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

" Changing cursor and highlighting line when in insert mode
autocmd InsertEnter,InsertLeave * set cul!
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

set autoread

" -----------------------------------------------------------------------------
"" Mappings
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

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

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

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" -----------------------------------------------------------------------------
" ALE
" -----------------------------------------------------------------------------

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

" -----------------------------------------------------------------------------
"  Airline
" -----------------------------------------------------------------------------

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

" -----------------------------------------------------------------------------
"  Git Gutter
" -----------------------------------------------------------------------------

let g:gitgutter_max_signs             = 5000
let g:gitgutter_sign_removed          = '✗'
let g:gitgutter_sign_added            = '✓'
let g:gitgutter_map_keys              = 0
let g:gitgutter_diff_args             = '--ignore-space-at-eol'

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
