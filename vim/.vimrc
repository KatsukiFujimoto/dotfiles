" 古臭いvi互換機能を無効化する
if &compatible
  set nocompatible
endif
" <Leader>キーの割り当て
let mapleader = "\<Space>"
" Neovimで英語表示にする
let $LANG="en_US.UTF-8"
if has('nvim')
  let g:ruby_host_prog = '~/.rbenv/shims/neovim-ruby-host'
  let g:python3_host_prog = expand('~/nvim-python3/bin/python3')
  let g:python_host_prog = expand('~/nvim-python2/bin/python2')
endif

" ================ dein.vim ================
" dein.vimをアップデートする
" dein.vimのインストールされたリポジトリにてgit pull origin masterを実行する
" dein.vimでインストールしたプラグインをアップデートする
" :call dein#update()
" :call dein#recache_runtimepath() " キャッシュをクリア

" dein.vimインストール時に指定したディレクトリをセット
if has('nvim')
  let s:dein_dir = expand('~/.cache/dein/nvim')
else
  let s:dein_dir = expand('~/.cache/dein/vim')
endif
" dein.vimの実態があるディレクトリをセット
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" dein.vimがインストールされていない場合はインストール
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif

  execute 'set runtimepath^=' . s:dein_repo_dir
endif

" プラグインの読み込みとキャッシュ
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  for absolute_path in split(globpath('~/.dein/eager_load/', '*'), '\n')
    call dein#load_toml(absolute_path, {'lazy': 0})
  endfor
  for absolute_path in split(globpath('~/.dein/lazy_load/', '*'), '\n')
    call dein#load_toml(absolute_path, {'lazy': 1})
  endfor

  call dein#end()
  call dein#save_state()
endif

" インストールされていないプラグインがある場合はインストール
if dein#check_install()
  call dein#install()
endif

" ~/.deinにて削除したプラグインを削除
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

" ================ その他設定 ================
" ファイルの種類に応じてインデント
filetype plugin indent on
filetype on

" シンタックスハイライトを有効化
syntax enable

" カラースキームのカスタマイズ
autocmd ColorScheme * highlight Visual guibg=#585858 ctermbg=231
autocmd ColorScheme * highlight MatchParen guifg=white gui=bold

" Undoの永続化
if has('persistent_undo')
  if has('nvim')
    let undo_path = expand('~/.config/nvim/undo')
  else
    let undo_path = expand('~/.vim/undo')
  endif

  if !isdirectory(undo_path)
    call mkdir(undo_path, 'p')
  endif

  let &undodir = undo_path
  set undofile
endi

" autoreadの設定
set autoread
augroup vimrc_checktime
  autocmd!
  autocmd WinEnter * checktime
augroup END

" ハイライトをオフる
nnoremap <leader>nh :noh<CR>

" TypeScriptのフォーマッターでimportの{}がスペースで開かない問題を自前のフォーマッターで解決する
xnoremap <leader>tf :s/{\(.\{-}\)}/{ \1 }/g<CR>:noh<CR>

" 行が折り返し表示されている場合、行単位ではなく表示行単位でカーソル移動する
nnoremap j gj
nnoremap k gk

" insert mode / emacs like
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
inoremap <C-h> <BS>
inoremap <C-d> <Del>

" ウィンドウ操作
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>
nnoremap <C-h> :wincmd h<CR>
" up/left
nnoremap <Leader><C-l> :wincmd r<CR>
" down/right
nnoremap <Leader><C-h> :wincmd R<CR>
" move window to new tab
nnoremap <C-t> :wincmd T<CR>
nmap <C-w> :q<CR>

" ファイル操作
nmap <C-s> :w<CR>

" タブ操作
nmap <S-h> :tabprevious<CR>
nmap <S-l> :tabnext<CR>

" ビジュアルモードでのペースト後にクリップボードがペースト対象文字列にならないようにする
" https://vi.stackexchange.com/questions/25259/clipboard-is-reset-after-first-paste-in-visual-mode
xnoremap <expr> p 'pgv"'.v:register.'y`>'
xnoremap <expr> P 'Pgv"'.v:register.'y`>'

command! ShowPath :echo expand("%:p")

" 折り畳み状態の保存・復帰
function! LoadView() abort
  try
    " NeoVimでfzfやfern fzfなどでファイルを開こうとするとエラーとなるので、オフにしてみる
    " https://github.com/junegunn/fzf.vim/issues/1185
    silent! loadview
  catch /E32/
    return
  endtry
endfunction
function! MakeView() abort
  try
    " NeoVimでfzfやfern fzfなどでファイルを開こうとするとエラーとなるので、オフにしてみる
    " https://github.com/junegunn/fzf.vim/issues/1185
    silent! mkview
  catch /E32/
    return
  endtry
endfunction
autocmd BufWinLeave * call MakeView()
autocmd BufWinEnter * call LoadView()

" 行末の空白文字と全角の空白文字をハイライト
augroup HighlightUnnecessarySpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight UnnecessarySpaces term=underline ctermbg=Red guibg=Red
  autocmd VimEnter,WinEnter * match UnnecessarySpaces /\v(　)|(\s+$)/
augroup END

" ファイル保存時に行末の空白文字を削除する
" augroup DeleteUnnecessarySpaces
"   autocmd!
"   autocmd BufWritePre * :%s/\v\s+$//ge
" augroup END

" True Colorを使える様にする
if has('nvim')
  set termguicolors
endif
" regexpengine
" https://www.soum.co.jp/misc/vim-advanced/3/
set re=0
" swapfileの指定
" set swapfile
set noswapfile
" Vimのバッファやレジスタ内などで使用する文字コードの設定
set encoding=utf-8
" スクリプト（ここではvimrc）で使われている文字コードを宣言
" Vimがスクリプトを処理する時、scriptencodingで指定した文字コードからencodingで指定した文字エンコードに変換される
scriptencoding utf-8
" 既存のファイルを開く時、Vimが使用する文字コードを判定する順番
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
" 想定される改行コードの指定をする
set fileformats=unix,dos,mac
" if hidden is not set, TextEdit might fail
set hidden
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" キーコードシーケンスが終了するのを待つ時間を短くする。
set ttimeoutlen=10
" 描画を非同期に？
" マクロの途中で画面を再描画しないでください。その方が早く完了します。
set lazyredraw
" ターミナル接続を高速化
" set nottyfast
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" 折り畳み方法の設定
set foldmethod=syntax
set foldlevel=99
" 展開するスペースの個数
set tabstop=2
" Vimが挿入するインデントの幅
set shiftwidth=2
" タブをスペースに展開
set expandtab
" ヤンクやコピーした文字列が無名レジスタだけでなく、クリップボードレジスタにも入るようにする
set clipboard+=unnamed
" 長い行を折り返さない
set nowrap
" 行数を表示する
set number
" 全行描画で動作が遅くなる原因となるため、オフ
" set cursorline
set nocursorline
" 全行描画で動作が遅くなる原因となるため、オフ
" set cursorcolumn
set nocursorcolumn
" beep音・画面フラッシュを無効化
set vb t_vb=
" タイトルを表示する
set title
" 検索ヒットした箇所をハイライト
set hlsearch
" インクリメントサーチを有効化（検索キーワードを変更する度にリアルタイムで検索される）
set incsearch
" 大文字・小文字を区別しないで検索する
set ignorecase
" 大文字を入力した場合、大文字・小文字を区別して検索する
set smartcase
" 改行時に自動でインデントを整える
set smartindent
" コマンドライン補完表示を有効化
set wildmenu
" タブに情報を表示させる
set showtabline=2
" ファイル名やファイルの種類といったようなメタデータを表示させる
set laststatus=2
" テキストが無い箇所も矩形選択できるようにする
set virtualedit=block
