set encoding=utf-8
scriptencoding utf-8
" ↑1行目は読み込み時の文字コードの設定
" ↑2行目はVim Script内でマルチバイトを使う場合の設定
" Vim scritptにvimrcも含まれるので、日本語でコメントを書く場合は先頭にこの設定が必要になる

set nocompatible

filetype off

set nowritebackup
set nobackup

set virtualedit=block
set ambiwidth=double
filetype plugin indent on

"----------------------------------------
" カーソル移動
"----------------------------------------
set whichwrap=b,s,h,l,<,>,[,],~ "カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set number " 行番号を表示
" set cursorline " カーソルラインをハイライト → これをONにしたら移動がメッチャ重くなったのでOFFに。
" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
nnoremap <down> gj
nnoremap <up> gk
" ^, $,を押しやすく。
nnoremap <Space>h ^
nnoremap <Space>l $

" コマンドラインモードでCtr+p,nをupとdownに変更。（実践vim p102参照）
" cnoremap <c-p> <up>
" cnoremap <c-n> <down>
" →BTTで設定。
" バックスペースキーの有効化
set backspace=indent,eol,start
" ~~~~~~insertモード中の移動(Emacs風キーバインドらしい)~~~~~~~~
" imap <C-p> <UP>
" imap <C-n> <DOWN>
" →BTTで設定。
imap <C-f> <RIGHT>
imap <C-b> <LEFT>
imap <C-d> <DELETE>
imap <C-e> <END>
imap <C-a> <HOME>

"----------------------------------------
" コマンドラインモード（Exコマンド）
"----------------------------------------
" %%で現在のディレクトリのパスを表示（%:hと同じになる）（実践vim p136参照）
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"----------------------------------------
" 入力関連設定
"----------------------------------------
set nrformats= "<C-a>コマンド使用時に0が頭についている数字も10進数とみなすように修正（デフォでは8進数とみなす）

"----------------------------------------
" 検索
"----------------------------------------
set ignorecase "検索で大文字小文字を区別しない
set smartcase "検索パターンに大文字がある場合ignorecaseをキャンセル
set wrapscan
set incsearch "インクリメンタルサーチ. １文字入力毎に検索を行う
set hlsearch "検索結果をハイライト
set ic
"検索のハイライトを無効化するためのショートカット
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
"----------------------------------------
" 自動補完
"----------------------------------------
set infercase

set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数
" 括弧の入力補完設定
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><BS><ESC><S-o>
inoremap ( ()<Left>
inoremap (<Enter> ()<Left><CR><BS><ESC><S-o>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

"----------------------------------------
" 表示設定
"----------------------------------------
set noerrorbells
set novisualbell
set visualbell t_vb=
set shellslash
set cinoptions+=:0
set cmdheight=2
set showcmd
set display=lastline
set list
set listchars=tab:^\ ,trail:~

set showmatch " 括弧の対応関係を一瞬表示する
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する カッコ・タグジャンプ

"ファイル表示の<C-g>を編集、フルパス表示に------
nnoremap <C-g> 1<C-g>
"ウィンドウ意を移動しても消えないように。
augroup EchoFilePath
  autocmd WinEnter * execute "normal! 1\<C-g>"
augroup END
"-----------------------------------------------

" from fujimura
set ambiwidth=double
set expandtab
set guioptions-=T
set guioptions+=a
set guioptions-=m
set guioptions+=R
set showmatch
set nobackup
set noswapfile
set nofoldenable
set title
set whichwrap=4

"インデント関連
set autoindent          "改行時に前の行のインデントを計測
set smartindent         "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set expandtab           "タブ入力を複数の空白に置き換える

set tabstop=2           "タブを含むファイルを開いた際, タブを何文字の空白に変換するか
set shiftwidth=2        "自動インデントで入る空白数
set softtabstop=2       "キーボードから入るタブの数

if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "ファイルタイプに合わせたインデントを利用
  filetype indent on
  "sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtabの略
  autocmd FileType sql         setlocal sw=4 sts=4 ts=4 et
endif

"vimでクリップボードが使えるように設定。
set clipboard+=unnamed

"バッファのイベントが生じるたびにctagsを呼び出す
" :autocmd BufWritePost * call system("ctags -R")

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" ファイルオープンを便利に----------------------------------------------------------
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
" let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <Space>b :Unite buffer<CR>
" 最近使ったファイルの一覧
nnoremap <Space>r :<C-u>Unite file_mru<CR>
" カレントディレクトリ配下のファイル一覧
nnoremap <Space>f :<C-u>Unite -buffer-name=file file<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
" noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>

"Vimの便利な画面分割＆タブページと、それを更に便利にする方法-------------------------
"http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
" 縦横最大化
" nnoremap so <C-wA>_<C-w>|
" 分割画面の大きさを揃える
nnoremap s= <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
" nnoremap <Space>T :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
" アクティブなウィンドウ以外を閉じる
nnoremap so <C-w>o

"バッファをサクサク移動するためのキーマッピング(実践vim p116)--------------------------
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

NeoBundle 'kana/vim-submode'
"Vimの便利な画面分割＆タブページと、それを更に便利にする方法-------------------------end

" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
"nerdtreeのショートカット「ctrl+e」を設定
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" Gitを便利に使う-----------------------------
NeoBundle 'tpope/vim-fugitive'
" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow
" ステータス行に現在のgitブランチを表示する
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
" Required:
"---------------------------------------------

" ステータスラインの表示内容強化---------------------------
NeoBundle 'itchyny/lightline.vim'
"ステータスラインの設定------------------------------------
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの現在位置を表示する
"----------------------------------------------------------

"vim-powerlineのインストール
NeoBundle 'Lokaltog/vim-powerline'
"vim-powerlineの設定-------------------------------------------
let g:Powerline_symbols = 'fancy'

" Rails関連のプラグイン！~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Rails向けのコマンドを提供する
NeoBundle 'tpope/vim-rails'
" vim-railsの設定。
" autocmd User Rails.controller* Rnavcommand api app/controllers/api -glob=**/* -suffix=_controller.rb
" autocmd User Rails.controller* Rnavcommand tmpl app/controllers/tmpl -glob=**/* -suffix=_controller.rb
" autocmd User Rails Rnavcommand config config   -glob=*.*  -suffix= -default=routes.rb
" autocmd User Rails nmap :<C-u>Rco :<C-u>Rcontroller
nnoremap <Space>c :<C-u>Econtroller<CR>
" autocmd User Rails nmap :<C-u>Rmo :<C-u>Rmodel
nnoremap <Space>m :<C-u>Emodel<CR>
" autocmd User Rails nmap :<C-u>Rvi :<C-u>Rview
nnoremap <Space>v :<C-u>Eview<CR>
"カレントバッファがModelならば，db/schema.rbにとぶ。カレントバッファがControllerかつカーソル位置がアクションメソッド内あれば，対応するViewにとぶ。
"カーソル位置がアクションメソッドの外であれば，対応するHelper　→超便利な使えるやつ。
nnoremap <Space>R :<C-u>R<CR>
" 対応するテストファイルにとぶ。
nnoremap <Space>A :<C-u>A<CR>
" カーソル位置のシンボルに応じて定義元にジャンプしてくれる。defineのd。
nnoremap <Space>d gf

" slimファイルに色を付ける
NeoBundle 'slim-template/vim-slim'

" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'

" Rails関連のプラグイン！~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~end

" コメントO
NeoBundle 'tomtom/tcomment_vim'

" シングルクオートとダブルクオートの入れ替え等
NeoBundle 'tpope/vim-surround'

" surround.vimも.コマンドでの繰り返しの対象となる。
NeoBundle 'tpope/vim-repeat'

" インデントに色を付けて見やすくする--------------------------
NeoBundle 'nathanaelkane/vim-indent-guides'
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
"htlpとnerdtreeでvim-indent-guidesをオフにする。
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
"インデントのガイドを少し細くする。
let g:indent_guides_guide_size = 1
"インデントの色を設定
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=lightgrey ctermbg=244
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey  ctermbg=238
"--------------------------------------------------------------

" ログファイルを色づけしてくれる
NeoBundle 'vim-scripts/AnsiEsc.vim'

" 行末の半角スペースを可視化
NeoBundle 'bronson/vim-trailing-whitespace'

" vimrc に追記＆再読込して :NeoBundleInstall
NeoBundle 'altercation/vim-colors-solarized'

"vimのコメントアウトを「Ctrl+k」でできるように設定
NeoBundle "tyru/caw.vim.git"
nmap <C-K> <Plug>(caw:i:toggle)
vmap <C-K> <Plug>(caw:i:toggle)
"------------------------------------------------
"vimのhelpを日本語に！
NeoBundle 'vim-jp/vimdoc-ja'

"vimを使っているデザイナー向けプラグイン----------------------
" "http://qiita.com/alpaca_taichou/items/056a4c42fe7a928973e6
" http://qiita.com/muran001/items/9ce24525b3285678acc3
NeoBundle 'mattn/emmet-vim'
" NeoBundle 'open-browser.vim'
" NeoBundle 'mattn/webapi-vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'kchmck/vim-coffee-script'
"-------------------------------------------------------------

"vimを使っているデザイナー向けプラグイン----------------------
"http://qiita.com/ysm001/items/8ae97cfdaae3f5fe79f4#html--css%E9%96%A2%E9%80%A3
NeoBundle 'ap/vim-css-color'
NeoBundle 'elzr/vim-json'
"-------------------------------------------------------------

"貼り付け時自動でpaste modeにする
NeoBundle 'ConradIrwin/vim-bracketed-paste'

" emmet-vim の設定--------------------------------------
let g:user_emmet_leader_key = '<C-Y>'
let g:user_emmet_settings = {
    \    'variables': {
    \      'lang': "ja"
    \    },
    \   'indentation': '  '
    \ }
" emmet-vim の設定--------------------------------------end

" neocomplete・neosnippet・neosnippet-snippetsのインストール***********************
if has('lua') " lua機能が有効になっている場合・・・・・・①
    " コードの自動補完
    NeoBundle 'Shougo/neocomplete.vim'
    " スニペットの補完機能
    NeoBundle "Shougo/neosnippet"
    " スニペット集
    NeoBundle 'Shougo/neosnippet-snippets'
endif

"----------------------------------------------------------
" neocomplete・neosnippetの設定
"----------------------------------------------------------
if neobundle#is_installed('neocomplete.vim')
    " Vim起動時にneocompleteを有効にする
    let g:neocomplete#enable_at_startup = 1
    " smartcase有効化. 大文字が入力されるまで大文字小文字の区別を無視する
    let g:neocomplete#enable_smart_case = 1
    " 3文字以上の単語に対して補完を有効にする
    let g:neocomplete#min_keyword_length = 3
    " 区切り文字まで補完する
    let g:neocomplete#enable_auto_delimiter = 1
    " 1文字目の入力から補完のポップアップを表示
    let g:neocomplete#auto_completion_start_length = 1
    " バックスペースで補完のポップアップを閉じる
    inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"
    " タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ
    imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"
endif
" neocomplete・neosnippet・neosnippet-snippets終了！******************************

" gitの差分を表示するぜ
NeoBundle 'airblade/vim-gitgutter'
" textobj のベース。これを入れないと他のtextobjは動かない！！
NeoBundle "kana/vim-textobj-user"
" ae, aiで全体選択
NeoBundle 'kana/vim-textobj-entire'
" 検索・置換を便利にするvim-abolish http://qiita.com/yuku_t/items/77a3361ff4d27bda641e
NeoBundle 'tpope/vim-abolish'

" markdownの設定。プレビューなど。######################################
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a Firefox'
" ######################################################################
" textハイライト
NeoBundle 'HybridText'
autocm BufEnter * if &filetype == "" || &filetype == "text" || &filetype == "txt" | setlocal ft=hybrid | endif

" React native関連
NeoBundle 'vim-syntastic/syntastic'
NeoBundle 'pmsorhaindo/syntastic-local-eslint.vim'

" syntasticのための設定
let g:syntastic_javascript_checkers=['eslint']
" rubocopもvimで自動チェック
let g:syntastic_ruby_checkers = ['rubocop']

" ここから下は Syntastic のおすすめの設定
" ref. https://github.com/scrooloose/syntastic#settings

" エラー行に sign を表示
let g:syntastic_enable_signs = 1
" location list を常に更新
let g:syntastic_always_populate_loc_list = 0
" location list を常に表示
let g:syntastic_auto_loc_list = 1
" ファイルを開いた時にチェックを実行する
let g:syntastic_check_on_open = 1
" :wq で終了する時もチェックする
let g:syntastic_check_on_wq = 0

" JavaScriptのシンタックスハイライト
" NeoBundle 'pangloss/vim-javascript' "↓のに移行
NeoBundle 'othree/yajs.vim'
" JSXのシンタックスハイライト
NeoBundle 'maxmellon/vim-jsx-pretty'
" JSコード補完
NeoBundle 'marijnh/tern_for_vim'

call neobundle#end()
" @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@neobundle終了!

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" http://inari.hatenablog.com/entry/2014/05/05/231307---------------------------
""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgrey
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
"---------------------------------------------------------------------------------

" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample---------------------------------
""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
"------------------------------------------------------------------------------------------------------------------

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""

"マウスの有効化-------------------------
if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif
"-------------------------------------end

"クリップボードからペーストする時だけインデントしないように---
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
"------------------------------------------------------------end

"vimをMolokai色に！-------------------
syntax enable
let g:molokai_original = 1
" molokai のビジュアルモードが見辛いので色を変える
autocmd colorscheme molokai highlight Visual ctermbg=8
colorscheme molokai  " カラースキーマ molokai 指定
"--------------------------------------

"coffeeに必要な設定、便利な設定-------------------------------
" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデントを設定
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
" オートコンパイル
  "保存と同時にコンパイルする
" autocmd BufWritePost *.coffee silent make!
  "エラーがあったら別ウィンドウで表示
" autocmd QuickFixCmdPost * nested cwindow | redraw!
" Ctrl-cで右ウィンドウにコンパイル結果を一時表示する
nnoremap <silent> <C-C> :CoffeeCompile vert <CR><C-w>h
"------------------------------------------------------------

" lightline.vimの設定----------------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightlineModified',
      \   'readonly': 'LightlineReadonly',
      \   'fugitive': 'LightlineFugitive',
      \   'filename': 'LightlineFilename',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \   'mode': 'LightlineMode',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? '⭠ '.branch : ''
  endif
  return ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
"----------------------------------------------------------------------------end
" submode.vim
" http://d.hatena.ne.jp/thinca/20130131/1359567419
" ウィンドウサイズの変更キーを簡易化する
" [C-w],[+]または、[C-w],[-]
" 上方で設定しているs-,s+,s>,s<でも簡易化
call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')
" gt,gTでも簡易化
call submode#enter_with('changetab', 'n', '', 'gt', 'gt')
call submode#enter_with('changetab', 'n', '', 'gT', 'gT')
call submode#map('changetab', 'n', '', 't', 'gt')
call submode#map('changetab', 'n', '', 'T', 'gT')
