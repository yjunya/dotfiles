" vimをutf-8化
set encoding=utf-8
scriptencoding utf-8

let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

"-----------------------------------------------------------
" vim-plug
"-----------------------------------------------------------
"
" :PlugInstallで導入
" :PlugCleanで削除

if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  endif
endif
"-----------------------------------------------------------
call plug#begin('~/.vim/plugged')
" カラースキーム
Plug 'cocopon/iceberg.vim'
" コメントON/OFFを手軽に実行 gccもしくは選択からgc
Plug 'tomtom/tcomment_vim'
" 自動で括弧
Plug 'cohama/lexima.vim'
" filer
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler'
call plug#end()
"--vim-plug-------------------------------------------------


" "-----------------------------------------------------------
" " Unite
" "-----------------------------------------------------------
nnoremap <leader>b :<C-u>Unite buffer -buffer-name=file<CR>
"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
	"ESCでuniteを終了
  nmap <buffer> l <CR>
endfunction


" "-----------------------------------------------------------
" " VimFiler
" "-----------------------------------------------------------
" "vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer = 1
"セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0


"デフォルトのキーマッピングを変更
augroup vimrc
  autocmd FileType vimfiler call s:vimfiler_my_settings()
augroup END
function! s:vimfiler_my_settings()
  nmap <buffer> q <Plug>(vimfiler_exit)
endfunction

"現在開いているバッファのディレクトリを開く
nnoremap <silent> <leader>e :<C-u>VimFilerBufferDir -quit<CR>
"現在開いているバッファをIDE風に開く
nnoremap <silent> <leader>tr :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>


"-----------------------------------------------------------
" カラースキーム
"-----------------------------------------------------------
colorscheme iceberg
hi Normal ctermbg=NONE ctermfg=252 guibg=#NONE guifg=#c6c8d1
highlight CursorLine ctermbg=239
highlight CursorColumn ctermbg=239
"--カラースキーム-------------------------------------------

"-----------------------------------------------------------
" クリップボードからのペースト
"-----------------------------------------------------------
" 挿入モードでクリップボードからペーストする時に自動でインデントさせないようにする
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
"-クリップボードからのペースト------------------------------

"-----------------------------------------------------------
" 一般設定
"-----------------------------------------------------------
" バックアップファイルを作らない
set nowritebackup
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd

" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
" set cursorcolumn
" インデントはスマートインデント
set smartindent
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" yankとcripboardが共有
set clipboard=unnamed
"-一般設定--------------------------------------------------

" 句読点fix
command! FixKutouten call s:FixKutouten()
function! s:FixKutouten()
  %s/、/，/g
  %s/。/．/g
endfunction

"-----------------------------------------------------------
" key binding
"-----------------------------------------------------------

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" 折り返し時に表示行単位での移動できるようにする
nnoremap k   gk
nnoremap j   gj
vnoremap k   gk
vnoremap j   gj
nnoremap gk  k
nnoremap gj  j
vnoremap gk  k
vnoremap gj  j

nnoremap K  {
nnoremap J  }
vnoremap J  }
vnoremap K  {
nnoremap {  K
nnoremap }  J
vnoremap }  J
vnoremap {  K

" 行末
nnoremap H  ^
nnoremap L  $
vnoremap H  ^
vnoremap L  $

" nnoremap ; :
" nnoremap : ;
" vnoremap ; :
" vnoremap : ;

" 画面分割
nnoremap s <Nop>
nnoremap S <Nop>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h

" 危険なキー
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

" vを二回で行末まで選択
vnoremap v $h

" エラー一覧
nnoremap <leader>? :lopen<CR>

if exists('g:vscode')
  " VSCode extension
  set buftype=
  " 置換
  nnoremap gs  :<C-u>%s///g
  vnoremap gs  :s///g
  " ファイル保存
  nmap <leader>w  <cmd>call VSCodeNotify('workbench.action.files.save')<cr>
  nmap <leader>q  <cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<cr>
  " タブ
  nnoremap <silent>tt  <Nop>
  nnoremap <C-h>  <Nop>
  nnoremap <C-l>  <Nop>
  nnoremap th  <cmd>call VSCodeNotify('workbench.action.previousEditor')<cr>
  nnoremap tl  <cmd>call VSCodeNotify('workbench.action.nextEditor')<cr>
else
  " ordinary Neovim
  " 置換
  nnoremap gs  :<C-u>%s///g<Left><Left><Left>
  vnoremap gs  :s///g<Left><Left><Left>
  " ファイル保存
  nnoremap <leader>w :<C-u>w<CR>
  nnoremap <leader>q :<C-u>q<CR>
  nnoremap <leader>Q :<C-u>q!<CR>
  " jjでエスケープ
  inoremap <silent>jj <ESC>
  " タブ
  nnoremap <silent>tt  :<C-u>tabe<CR>
  nnoremap <C-h>  gT
  nnoremap <C-l>  gt
  nnoremap th  gT
  nnoremap tl  gt
endif
"-keybinding------------------------------------------------
