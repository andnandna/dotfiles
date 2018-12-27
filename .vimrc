""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" ファイルオープン
Plug 'Shougo/unite.vim'

" Unite.vimで最近使ったファイルを表示できる
Plug 'Shougo/neomru.vim'

" ファイルをtree表示してくれる
Plug 'scrooloose/nerdtree'

" 別タブを開いた時もNERTreeを維持
Plug 'jistr/vim-nerdtree-tabs'

" NERDTreeにGitの変更情報を表示
Plug 'Xuyuanp/nerdtree-git-plugin'

" Ruby向けにendを自動挿入してくれる
Plug 'tpope/vim-endwise'

" Rails開発用
Plug 'tpope/vim-rails'

" Rubyのローカル変数をハイライトする
Plug 'todesking/ruby_hl_lvar.vim'

" vim上でGitコマンドを使用できる
Plug 'tpope/vim-fugitive'

" ウィンドウの分割サイズを調整"
Plug 'simeji/winresizer'

" コメントON/OFFを手軽に実行
Plug 'tomtom/tcomment_vim'

" csv見る
Plug 'mechatroner/rainbow_csv'

" インデントに色を付けて見やすくする
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
" NERDTreeでは無効化
let g:indent_guides_exclude_filetypes = ['nerdtree']
" 色設定
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#2e3436 ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray

" 行末の半角スペースを可視化
Plug 'bronson/vim-trailing-whitespace'

" HTMLコード簡易生成
Plug 'mattn/emmet-vim'

" Slimのシンタックスハイライト
Plug 'slim-template/vim-slim'

" Lineに詳細情報表示とテーマ
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'raven'

" jとkの移動を高速化
Plug 'rhysd/accelerated-jk'

" カッコ対応付け拡張
Plug 'andymass/vim-matchup'

" vimカラースキーム
Plug 'cocopon/iceberg.vim'
Plug 'davidklsn/vim-sialoquent'
Plug 'AlessandroYorba/Despacio'
Plug 'deathlyfrantic/vim-distill'
Plug 'scwood/vim-hybrid'
Plug 'atelierbram/vim-colors_duotones'
Plug 'gilgigilgil/anderson.vim'
Plug 'tjammer/blayu.vim'
Plug 'nightsense/snow'
Plug 'phanviet/Sidonia'

call plug#end()

""""""""""""""""""""""""""""""
" 自動閉じ括弧挿入
""""""""""""""""""""""""""""""
inoremap { {}<LEFT>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>

""""""""""""""""""""""""""""""
" 移動、操作
""""""""""""""""""""""""""""""
noremap <Space>h  ^
noremap <Space>l  $
noremap <C-f> <esc>
noremap! <C-f> <esc>
" カッコ対応付け(%)用
map <Space>m  %
" NERDTreeを開く
nnoremap <silent><C-l> :NERDTreeFocusToggle<CR>
" 画面分割系移動
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sh <C-w>h
nnoremap sl <C-w>l
nnoremap sw <C-w>w
nnoremap sc <C-w>x
" タブ系移動
nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp gT
" コメントアウト
nnoremap <Space><Space> :TComment<CR>

" vim上でpythonファイル実行
autocmd BufNewFile,BufRead *.py nnoremap <C-i> :!python %

""""""""""""""""""""""""""""""
" 各種オプション
""""""""""""""""""""""""""""""
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set number
set wildmenu
set history=5000
set laststatus=2
set cmdheight=2
set scrolloff=4
set list
set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%
set wildmenu
set wildmode=list:longest,full
set noswapfile
set background=dark
set incsearch
set termguicolors
set ttyfast
set lazyredraw
set cursorline
set clipboard=unnamed,autoselect
syntax on
colorscheme duotone-darkcave

""""""""""""""""""""""""""""""""""
" 手を離した時だけcursorline有効
""""""""""""""""""""""""""""""""""
" augroup vimrc-auto-cursorline
"   autocmd!
"   autocmd CursorMoved,CursorMovedI,WinLeave * setlocal nocursorline
"   autocmd CursorHold,CursorHoldI * setlocal cursorline
" augroup END

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unite.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" NERDTree設定
""""""""""""""""""""""""""""""
" NERDTreeで隠しファイルを表示
let NERDTreeShowHidden = 1
" ファイルが指定されていなければツリーも表示させる
if argc() == 0
  let g:nerdtree_tabs_open_on_console_startup=1
end
" 他のバッファを全て閉じた時にNERDTreeが開いてたら一緒に閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" filetypeの自動検出
filetype on
