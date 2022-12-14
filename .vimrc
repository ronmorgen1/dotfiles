"
"		db    db d888888b .88b  d88.
"		88    88   `88'   88'YbdP`88
"		Y8    8P    88    88  88  88
"		`8b  d8'    88    88  88  88
"		 `8bd8'    .88.   88  88  88
"		   YP    Y888888P YP  YP  YP
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=$HOME/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()

filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set backupdir=~/.vim/backups   " set backup folder
set undodir=~/.vim/undo        " set undo folder
set directory=~/.vim/swaps     " set swap folder
set number                     " Show line numbers
set linebreak                  " Break lines at word (requires Wrap lines)
set showbreak=+++              " Wrap-broken line prefix
set textwidth=100              " Line wrap (number of cols)
set showmatch                  " Highlight matching brace
set visualbell                 " Use visual bell (no beeping)
set hlsearch                   " Highlight all search results
set smartcase                  " Enable smart-case search
set ignorecase                 " Always case-insensitive
set incsearch                  " Searches for strings incrementally
set autoindent                 " Auto-indent new lines
set autoread                   " Auto-reload file on editing
set shiftwidth=4               " Number of auto-indent spaces
set smartindent                " Enable smart-indent
set smarttab                   " Enable smart-tabs
set softtabstop=4              " Number of spaces per Tab
set ruler                      " Show row and column ruler information
set undolevels=1000            " Number of undo levels
set backspace=indent,eol,start " Backspace behaviour

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color scheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
colorscheme gruvbox
set background=dark
set t_Co=256

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>

let g:NERDTreeIgnore = ['.idea','.git','^venv']
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"
let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeMinimalUI=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline settings and theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'
