
filetype off

set rtp+=$HOME/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mhartington/oceanic-next'
Plugin 'tpope/vim-fugitive'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'dense-analysis/ale'
Plugin 'chrisbra/csv.vim'

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
syntax enable
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme OceanicNext
set background=dark

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabnext<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>

let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"
let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeMinimalUI=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline settings and theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_solarized_bg='dark'
let g:airline#extensions#ale#enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

let g:ale_fixers = {
  \  '*': ['remove_trailing_lines', 'trim_whitespace'],
  \  'sh': ['prettier'],
  \  'json': ['prettier'],
  \  'markdown': ['prettier'],
  \  'yaml': ['yamlfix']
  \}
