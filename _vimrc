set nocompatible

filetype off

set nowritebackup
set nobackup

set virtualedit=block
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set ambiwidth=double
set wildmenu

filetype plugin indent on

"----------------------------------------
" 検索
"----------------------------------------
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch

"----------------------------------------
" 表示設定
"----------------------------------------
set noerrorbells
set novisualbell
set visualbell t_vb=
set shellslash
"set showmatch matchtime=1
set cinoptions+=:0
set cmdheight=2
set laststatus=2
set showcmd
set display=lastline
set list
set listchars=tab:^\ ,trail:~
set history=10000

"--
" from fujimura
set ambiwidth=double
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set guioptions-=T
set guioptions+=a
set guioptions-=m
set guioptions+=R
set autoindent
set showmatch
set smartindent
set nobackup
set noswapfile
set nofoldenable
set title
set number
set whichwrap=4
syntax on
