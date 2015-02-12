"#######################
"NeoBundle
"#######################
if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
NeoBundle 'scrooloose/syntastic'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'ZenCoding.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'Shougo/neomru.vim'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

"#######################
" unite
"#######################
nnoremap    [unite]   <Nop>
nmap    <Space>u [unite]
nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> ,vr :UniteResume<CR>

"#######################
" 表示系
"#######################
set number "行番号表示
set showmode "モード表示
set title "編集中のファイル名を表示
set ruler "ルーラーの表示
set showcmd "入力中のコマンドをステータスに表示する
set showmatch "括弧入力時の対応する括弧を表示
set laststatus=0 "ステータスラインを常に表示
syntax enable
if system('uname') == "Darwin\n"
  set background=light
  colorscheme solarized
  "colorscheme molokai
endif

"#######################
" プログラミングヘルプ系
"#######################
set cindent "オートインデント
set expandtab "タブの代わりに空白文字挿入
set ts=2 sw=2 sts=0 "タブは半角4文字分のスペース
" ファイルを開いた際に、前回終了時の行で起動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

"#######################
" 検索系
"#######################
set ignorecase "検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
"set wrapscan "検索時に最後まで行ったら最初に戻る
set noincsearch "検索文字列入力時に順次対象文字列にヒットさせない
set hlsearch "検索語を強調表示

"#######################
" コマンド系
"#######################
set wildmenu "コマンドライン補完を便利に
set showcmd "タイプ途中のコマンドを画面最下行に表示
set cmdheight=1 "コマンドラインの高さを2行に

"#######################
" 入力系
"#######################
set backspace=indent,eol,start "バックスペースでインデント、改行の削除
set whichwrap=b,s,h,l,[,],<,> "カーソルで行頭・行末移動

"#######################
" ウインドウ系 
"#######################
set splitright
set splitbelow

"#######################
" その他
"#######################
set confirm "バッファが変更されているとき、保存するか確かめる
set visualbell "ビープの代わりにビジュアルベルを使う
set t_vb= "ビジュアルベル無効
set mouse=a "全モードでマウス有効
set termencoding=utf-8
set formatoptions=l
set nobackup
set noswapfile
set noundofile

let OSTYPE = system('uname')
if OSTYPE == "Darwin\n"
  set clipboard=unnamed,autoselect "ヤンクした時にクリップボードにコピー
elseif OSTYPE == "Linux\n"
  set clipboard=unnamedplus
endif

"#######################
" syntax 
"#######################
let java_highlight_all = 1

"#######################
" Keymap
"#######################
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
noremap <C-h> ^
noremap <C-l> $
