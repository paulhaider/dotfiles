set nocompatible " not compatible with vi

call plug#begin()

Plug 'davidhalter/jedi-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ervandew/supertab'
Plug 'klen/python-mode'
Plug 'gerw/vim-latex-suite'
Plug 'scrooloose/nerdtree'
Plug 'chriskempson/base16-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
Plug 'tmhedberg/matchit'

" All of your Plugins must be added before the following line
call plug#end() " required

" Put your non-Plugin stuff after this line

syntax enable " enable syntax highlighting
filetype on
filetype plugin on
filetype indent on " load filetype-specific indent files

" colorscheme configuration
set t_Co=256
" set background=dark
let base16colorspace=256
" colorscheme base16-default" colorscheme
" colorscheme badwolf
execute "set background=".$BACKGROUND
execute "colorscheme ".$THEME

if has('gui_running')
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ Book\ 8
endif

" change working directory to current file
set autochdir
" autocmd BufEnter * silent! lcd %:p:h " works probably better with some plugins

set clipboard+=unnamedplus " access system clipboard
set mouse=a
" set timeoutlen=1000 ttimeoutlen=0
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
set showmatch " highlight matching
set incsearch " set as characteres are entered
set hlsearch " highlight matches
set breakindent
let python_highlight_all = 1 " enable all Python syntax highlighting features

" toggle invisible characters
set invlist
set listchars=tab:▸\ ,trail:⋅,extends:❯,precedes:❮
" set listchars=tab:▸\ ,eol:↩,trail:⋅,extends:❯,precedes:❮

" Plugin specific configuration

" airline configuration
set laststatus=2 "show airline all the time
let g:powerline_pycmd = "py3"
let g:airline_powerline_fonts = 1 "use powerline fonts
let g:airline_theme='base16'
" let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:tmuxline_preset = 'powerline'
set noshowmode

" let g:airline_left_sep = ''
" let g:airline_right_sep = ''

" jedi configuration
let g:jedi#show_call_signatures = 1

" pymode configuration

" Python-mode
let g:pymode = 1
let g:pymode_rope = 0
let g:pymode_syntax = 0
let g:pymode_rope_guess_project = 0
let g:pymode_python = 'python3'

" Documentation
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'

" Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
"
" syntax highlighting
" let g:pymode_syntax = 1
" let g:pymode_syntax_all = 1
" let g:pymode_syntax_indent_errors = g:pymode_syntax_all
" let g:pymode_syntax_space_errors = g:pymode_syntax_all
"
" Don't autofold code
let g:pymode_folding = 0

" set default filetype back to 'tex' instead of 'plaintex'
let g:tex_flavor='latex'
