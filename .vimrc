syntax on
set smartindent

" エンコーディング
set encoding=utf-8 
scriptencoding utf-8
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double "文字が崩れる問題を解決
"タブ インデント
set tabstop=2 " タブステップ
set expandtab " タブ入力を複数の空白入力に置き換える
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=2 " smartindentで増減する幅
"filetype indent on
" 文字列検索
set hlsearch " 検索結果をハイライト
" ESCキー2度押しでハイライトの切り替え
" nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
" カーソル
set number " 行番号表示
" コマンド補完
set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数
" htmlのとじタグ保管
imap <C-/> <C-S-\>
" #で始まる行のインデントを保持する
inoremap # X<C-H>#
" タグジャンプ
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>
" スクリプトを編集しながら実行できるようにする
autocmd BufNewFile,BufRead *.rb nnoremap <C-e> :!ruby %
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python %
autocmd BufNewFile,BufRead *.pl nnoremap <C-e> :!perl %
autocmd BufNewFile,BufRead *.scala nnoremap <C-e> :!scala %
autocmd BufNewFile,BufRead *.hs nnoremap <C-e> :!stack runghc %
" 拡張子に合わせてインデント幅変更
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.yml setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END
" その他
set showmatch " 括弧の対応表示
set noswapfile " swapfileを作らない
nnoremap ; :
nnoremap : ;
" escをCtr-jに対応させる
noremap <C-j> <esc>
noremap! <C-j> <esc>
" imap <C-j> <esc> 
" NERDTreeのショートカット
nnoremap <C-t> :NERDTree<CR>
" vimを開いたときに自動的に表示
" autocmd vimenter * NERDTree
"キーボード・ショートカット
noremap <S-h>   ^
noremap <S-j>   }
noremap <S-k>   {
noremap <S-l>   $
" Tab移動
noremap sn gt
noremap sp gT
" unite.vimの設定
noremap <C-U><C-F> :Unite -buffer-name=file file<CR> " ファイル一覧
noremap <C-U><C-R> :Unite file_mru<CR> " 最近使ったファイル一覧
au FileType unite nnoremap <silent> <buffer> <expr> <C-i> unite#do_action('split') " ウィンドウを分割して開く
au FileType unite inoremap <silent> <buffer> <expr> <C-i> unite#do_action('split')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
" Markdown編集
" foldingを止める
let g:vim_markdown_folding_disabled = 1
"let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_math = 1
" TableModeの設定
let g:table_mode_corner = '|'
" brower preview
au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'google-chrome'

"---------------------------------------------------------
" Start Dein Settings.
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein.vim
call dein#begin(expand('~/.vim/dein.vim'))
call dein#add('Shougo/dein.vim')
" Treeを表示
call dein#add('scrooloose/nerdtree') 
" TeXを使用
"call dein#add('lervag/vimtex')
"ctrlP"
call dein#add('ctrlpvim/ctrlp.vim')
" Syntax HighLight系
" scalaのsyntaxhighlight
call dein#add('elzr/vim-json')
" emmet用
call dein#add('mattn/emmet-vim')
" windowサイズの変更用
call dein#add('kana/vim-submode')
" Vim-pluginTest
"call dein#add('pokotsun/helloworld-vim')
"call dein#add('bonjin6770/hello-beautiful-world.vim')
call dein#end()
"---------------------------------------------------------

call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>+')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>-')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>+')
call submode#map('winsize', 'n', '', '-', '<C-w>-')

"色関係
syntax on 
" コメントの色を変える
hi Comment ctermfg=darkcyan
hi Visual ctermfg=magenta
" カッコのハイライト時の色を変える
hi MatchParen cterm=bold ctermfg=cyan ctermbg=blue
set t_Co=256
" 表示行のみ色付け
set cursorline
hi clear CursorLine
"autocmd ColorScheme * highlight MatchParen gui=bold guibg=NONE guifg=blue
