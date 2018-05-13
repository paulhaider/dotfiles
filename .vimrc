set nocompatible " not compatible with vi but make vim behave in a more useful way

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'sjl/badwolf'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-latex/vim-latex'

call plug#end() " required
" Put your non-Plugin stuff after this line

syntax enable " enable syntax highlighting
filetype on " detect filetype
filetype plugin on " load filetype-specific plugin files
filetype indent on " load filetype-specific indent files

" colorscheme configuration
set t_Co=256
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

if has('gui_running')
  set guifont=SauceCodePro\ Nerd\ Font\ Mono\ 10
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
set noshowmode "hide default mode text already shown by airline

set updatetime=100 "set delay

" toggle invisible characters
set invlist
set listchars=tab:▸\ ,eol:↩,trail:⋅,extends:❯,precedes:❮

" Plugin specific configuration

" airline configuration
set laststatus=2 "show airline all the time
let g:airline_theme='base16'
let g:airline#extensions#tmuxline#enabled = 1 "use airline colors for tmuxline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline_powerline_fonts = 1 "use powerline fonts

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#H'}

"       \'x'    : '#(cut -d " " -f 1-3 /proc/loadavg)',

" no powerline seperators for tmuxline
" let g:tmuxline_separators = {
"     \ 'left' : '',
"     \ 'left_alt': '>',
"     \ 'right' : '',
"     \ 'right_alt' : '<',
"     \ 'space' : ' '}

" GitGutter configuration
let g:gitgutter_sign_added='┃'
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed='◢'
let g:gitgutter_sign_removed_first_line='◥'
let g:gitgutter_sign_modified_removed='◢'
