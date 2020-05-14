set nocompatible " not compatible with vi but make vim behave in a more useful way

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'sainnhe/edge'
Plug 'edkolev/tmuxline.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'lervag/vimtex'
Plug 'vim-syntastic/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/goyo.vim'
Plug 'mboughaba/i3config.vim'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

call plug#end() " required
" Put your non-Plugin stuff after this line

syntax enable " enable syntax highlighting
filetype on " detect filetype
filetype plugin on " load filetype-specific plugin files
filetype indent on " load filetype-specific indent files
autocmd BufNewFile,BufRead *.wl set syntax=mma
autocmd BufNewFile,BufRead *.mod set syntax=mma

aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
  au BufNewFile,BufRead ~/.config/sway/config set filetype=i3config
aug end

" colorscheme configuration
set termguicolors
set background=dark
" the configuration options should be placed before `colorscheme edge`
let g:edge_style = 'default'
let g:edge_disable_italic_comment = 0
colorscheme edge

if has('gui_running')
  set guifont=SauceCodePro\ Nerd\ Font\ Mono\ 10
endif

" change working directory to current file
" set autochdir

" clipboard only works if compiled with that option
set clipboard=unnamedplus " access system clipboard
set mouse=a " mouse scrolling
" " set timeoutlen=1000 ttimeoutlen=0
set tabstop=4 " number of visual spaces per TAB
set softtabstop=0 " number of spaces in tab when editing
set expandtab " tabs are spaces
set shiftwidth=2 " when indenting, use 2 spaces width
set smarttab
au BufNewFile,BufReadPost Makefile se noexpandtab " But TABs are needed in Makefiles
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

set textwidth=80
set colorcolumn=+1

set updatetime=100 "set delay

" toggle invisible characters
set invlist
set listchars=tab:▸\ ,eol:↩,trail:⋅,extends:❯,precedes:❮

" Plugin specific configuration

" airline configuration
set laststatus=2 " show airline all the time
let g:airline_theme='edge'
let g:airline#extensions#tmuxline#enabled = 1 "use airline colors for tmuxline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline_powerline_fonts = 1 "use powerline fonts
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#H'}

"       \'x'    : '#(cut -d " " -f 1-3 /proc/loadavg)',

" no powerline seperators for tmuxline
let g:tmuxline_powerline_separators = 1
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

" Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0 " weird output at start in vim if set to 1
let g:syntastic_check_on_wq = 0

" Vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_compiler_progname = 'nvr'
