set nocompatible " not compatible with vi but make vim behave in a more useful way

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'sjl/badwolf'

call plug#end() " required
" Put your non-Plugin stuff after this line

syntax enable " enable syntax highlighting
filetype on " detect filetype
filetype plugin on " load filetype-specific plugin files
filetype indent on " load filetype-specific indent files

" colorscheme configuration
set t_Co=256
let base16colorspace=256
set background=dark
execute "colorscheme base16-".$BASE16_THEME

if has('gui_running')
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ Book\ 8
endif

" change working directory to current file
" set autochdir

" clipboard only works if compiled with that option
set clipboard=unnamedplus " access system clipboard
set mouse=a " mouse scrolling
" " set timeoutlen=1000 ttimeoutlen=0
set tabstop=2 " number of visual spaces per TAB
set shiftwidth=2 " when indenting, use 2 spaces width
" set softtabstop=4 " number of spaces in tab when editing
" set expandtab " tabs are spaces
set number " show line numbers
set relativenumber " show relative line numbers
set showcmd " show commmand in bottom bar
set cursorline " highlight current line
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when need to
" set showmatch " highlight matching
set incsearch " set as characteres are entered
set hlsearch " highlight matches
" set breakindent

" toggle invisible characters
set invlist
set listchars=tab:▸\ ,trail:⋅,extends:❯,precedes:❮
" set listchars=tab:▸\ ,eol:↩,trail:⋅,extends:❯,precedes:❮

" Plugin specific configuration

" airline configuration
set laststatus=2 "show airline all the time
let g:airline_theme='base16'
" let g:airline_theme='badwolf'
let g:airline#extensions#tmuxline#enabled = 1 "use airline colors for tmuxline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline_powerline_fonts = 0 "use powerline fonts
let g:airline_symbols = get (g:,'airline_symbols',{})
let g:airline_symbols.maxlinenr='' " don't show symbol after line number
let g:tmuxline_preset = 'powerline'
" tmuxline preset showing loadavg
" let g:tmuxline_preset = {
"       \'a'    : '#S',
"       \'b'    : '#W',
"       \'win'  : ['#I', '#W'],
"       \'cwin' : ['#I', '#W', '#F'],
"       \'x'    : '#(cut -d " " -f 1-3 /proc/loadavg)',
"       \'y'    : '%H:%M:%S',
"       \'z'    : '#(date | cut -d " " -f 1-3 ) %Y'}
set noshowmode " already shown by airline

" no powerline seperators for tmuxline
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}
