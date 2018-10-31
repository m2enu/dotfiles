"scriptencodingと、このファイルのエンコーディングが一致するよう注意！ {{{1
"scriptencodingは、vimの内部エンコーディングと同じものを推奨します。
"改行コードは set fileformat=unix に設定するとunixでも使えます。
"=============================================================================
set nocompatible
scriptencoding cp932

" ユーザーランタイムパス設定 {{{1
"----------------------------------------
"Windows, unixでのruntimepathの違いを吸収するためのもの。
"$MY_VIMRUNTIMEはユーザーランタイムディレクトリを示す。
":echo $MY_VIMRUNTIMEで実際のパスを確認できます。
if isdirectory($HOME . '/.vim')
    let $MY_VIMRUNTIME = $HOME.'/.vim'
elseif isdirectory($HOME . '\vimfiles')
    let $MY_VIMRUNTIME = $HOME.'\vimfiles'
elseif isdirectory($VIM . '\vimfiles')
    let $MY_VIMRUNTIME = $VIM.'\vimfiles'
endif

"ランタイムパスを通す必要のあるプラグインを使用する場合、
"$MY_VIMRUNTIMEを使用すると Windows/Linuxで切り分ける必要が無くなります。
"例) vimfiles/qfixapp (Linuxでは~/.vim/qfixapp)にランタイムパスを通す場合
"set runtimepath+=$MY_VIMRUNTIME/qfixapp
set runtimepath+=$MY_VIMRUNTIME/plugin
set runtimepath+=$MY_VIMRUNTIME/autoload

" 内部エンコーディング指定 {{{1
"----------------------------------------
"内部エンコーディングのUTF-8化と文字コードの自動認識設定をencode.vimで行う。
"オールインワンパッケージの場合 vimrcで設定されているので何もしない。
"エンコーディング指定や文字コードの自動認識設定が適切に設定されている場合、
"次行の encode.vim読込部分はコメントアウトして下さい。
"silent! source $MY_VIMRUNTIME/plugin/encode.vim
"scriptencodingと異なる内部エンコーディングに変更する場合、
"変更後にもscriptencodingを指定しておくと問題が起きにくくなります。
scriptencoding cp932

" システム設定 {{{1
"----------------------------------------
"mswin.vimを読み込む
"source $VIMRUNTIME/mswin.vim
"behave mswin

"ファイルの上書きの前にバックアップを作る/作らない
"set writebackupを指定してもオプション 'backup' がオンでない限り、
"バックアップは上書きに成功した後に削除される。
set nowritebackup
"バックアップ/スワップファイルを作成する/しない
set nobackup
set noswapfile
"undoファイルを作成しない
set noundofile
"viminfoを作成しない
"set viminfo=
"クリップボードを共有
set clipboard+=unnamed
"8進数を無効にする。<C-a>,<C-x>に影響する
set nrformats-=octal
"キーコードやマッピングされたキー列が完了するのを待つ時間(ミリ秒)
set timeoutlen=3500
"編集結果非保存のバッファから、新しいバッファを開くときに警告を出さない
set hidden
"ヒストリの保存数
set history=50
"日本語の行の連結時には空白を入力しない
set formatoptions+=mM
"Visual blockモードでフリーカーソルを有効にする
set virtualedit=block
"カーソルキーで行末／行頭の移動可能に設定
set whichwrap=b,s,[,],<,>
"バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
"□や○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double
"コマンドライン補完するときに強化されたものを使う
set wildmenu
set wildignorecase
"一行の文字数制限を解除
set textwidth=0
"80文字目にラインを入れる
set colorcolumn=80
"マウスを有効にする
if has('mouse')
    set mouse=a
endif
"pluginを使用可能にする
"filetype plugin indent on
"モードライン有効化
set modeline
set modelines=5

" 検索 {{{1
"----------------------------------------
"検索の時に大文字小文字を区別しない
set ignorecase
"ただし大文字小文字の両方が含まれている場合は大文字小文字を区別する
set smartcase
"検索時にファイルの最後まで行ったら最初に戻る
set wrapscan
"インクリメンタルサーチ
set incsearch
"検索文字の強調表示
set hlsearch
"w,bの移動で認識する文字
"set iskeyword=a-z,A-Z,48-57,_,.,-,>
"vimgrep をデフォルトのgrepとする場合internal
"set grepprg=internal

" 表示設定 {{{1
"----------------------------------------
"スプラッシュ(起動時のメッセージ)を表示しない
"set shortmess+=I
"エラー時の音とビジュアルベルの抑制(gvimは.gvimrcで設定)
set noerrorbells
set novisualbell
set visualbell t_vb=
"マクロ実行中などの画面再描画を行わない
"set lazyredraw
"Windowsでディレクトリパスの区切り文字表示に / を使えるようにする
set shellslash
"行番号表示
"set number
"括弧の対応表示時間
set showmatch matchtime=1
" 対応括弧に'<'と'>'のペアを追加
set matchpairs& matchpairs+=<:>
"タブを設定
set tabstop=8
set shiftwidth=4
set softtabstop=4
" '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set shiftround
" タブをスペースに展開する
set expandtab
"自動的にインデントする
set autoindent
set nosmartindent
"Cインデントの設定
"set cinoptions+=:0
set nocindent
"タイトルを表示
set title
"コマンドラインの高さ (gvimはgvimrcで指定)
set cmdheight=2
set laststatus=2
"コマンドをステータス行に表示
set showcmd
"画面最後の行をできる限り表示する
set display=lastline
"Tab、行末の半角スペースを明示的に表示する
set list
set listchars=tab:>-,extends:<,trail:_

" ハイライトを有効にする
if &t_Co > 2 || has('gui_running')
    syntax on
endif

"色テーマ設定
"gvimの色テーマは.gvimrcで指定する
colorscheme desert
" ルーラーを表示 (noruler:非表示)
set ruler
" 行末で折り返さない
set nowrap

" ステータスラインに文字コード等表示 {{{1
""""""""""""""""""""""""""""""
"%<:行が長すぎるときに切り詰める位置
"%f:ファイル名(相対パス)、%m:修正フラグ([+]/[-])、%r:読込専用フラグ
"%h:ヘルプバッファ、%w:preview window flag
set statusline =%<%f\ %m\ %r%h%w
"%=:続くアイテムを右寄せに
"%Y:認識しているファイルタイプ
set statusline+=%=[%Y]
"ファイルエンコーディングとファイルフォーマット
set statusline+=%=%{'['.(&fenc!=''?&fenc:&enc).(&bomb?':BOM':'').']['.&ff.']'}
"iconvが使用可能の場合、カーソル上の文字コードをエンコードに応じた表示にするFencB()を使用
"if has('iconv')
"    set statusline+=%=[0x%{FencB()}]
"endif
"%l:現在のカーソルの行数、%L:総行数
set statusline+=%=[R%l/%L]
"%v:現在のカーソルの列数
set statusline+=%=[C%v]
"全文字数(plugin/ank_cc.vimが必要)
"set statusline+=%=[%{b:charCounterCount}]
"関数名表示
"set statusline+=%=[%{cfi#get_func_name()}]
"%P:カーソルの位置％表示
"set statusline+=%=%8P\

"FencB() : カーソル上の文字コードをエンコードに応じた表示にする
function! FencB()
    let c = matchstr(getline('.'), '.', col('.') - 1)
    let c = iconv(c, &enc, &fenc)
    return s:Byte2hex(s:Str2byte(c))
endfunction

function! s:Str2byte(str)
    return map(range(len(a:str)), 'char2nr(a:str[v:val])')
endfunction

function! s:Byte2hex(bytes)
    return join(map(copy(a:bytes), 'printf("%02X", v:val)'), '')
endfunction

" diff/patch {{{1
"----------------------------------------
"現バッファの差分表示(変更箇所の表示)
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
"ファイルまたはバッファ番号を指定して差分表示。#なら裏バッファと比較
command! -nargs=? -complete=file Diff if '<args>'=='' | browse vertical diffsplit|else| vertical diffsplit <args>|endif
"パッチコマンド
set patchexpr=MyPatch()
function! MyPatch()
     :call system($VIM."\\'.'patch -o " . v:fname_out . " " . v:fname_in . " < " . v:fname_diff)
endfunction

" ノーマルモード {{{1
"----------------------------------------
"ヘルプ検索
nnoremap <F1> K
"現在開いているvimスクリプトファイルを実行
nnoremap <F8> :source %<CR>
"強制全保存終了を無効化
nnoremap ZZ <Nop>
"カーソルをj k では表示行で移動する。物理行移動は<C-n>,<C-p>
"キーボードマクロには物理行移動を推奨
"h l は行末、行頭を超えることが可能に設定(whichwrap)
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
nnoremap l <Right>
"l を <Right>に置き換えても、折りたたみを l で開くことができるようにする
if has('folding')
    nnoremap <expr> l foldlevel(line('.')) ? "\<Right>zo" : "\<Right>"
endif
"検索後カーソル位置を画面中央に
"nnoremap n nzz
"nnoremap N Nzz
" .vimrcを開く
nnoremap <Space>.  :<C-u>edit $MYVIMRC<CR>
" source ~/.vimrc を実行する。
nnoremap <Space>,  :<C-u>source $MYVIMRC<CR>:noh<CR>

"自動で括弧を挿入
"imap ( ()<Left>
"imap { {}<Left>
"imap [ []<Left>

" 挿入モード {{{1
"----------------------------------------

" ビジュアルモード {{{1
"----------------------------------------

" コマンドモード {{{1
"----------------------------------------
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Delete>
cnoremap <C-h> <BS>
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>

" Vimスクリプト {{{1
"----------------------------------------
""""""""""""""""""""""""""""""
"ファイルを開いたら前回のカーソル位置へ移動
"$VIMRUNTIME/vimrc_example.vim
""""""""""""""""""""""""""""""
augroup vimrcEx
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line('$') |
        \   exe "normal! g`\"" |
        \ endif
augroup END

""""""""""""""""""""""""""""""
"挿入モード時、ステータスラインのカラー変更
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

""""""""""""""""""""""""""""""
"全角スペースを表示
""""""""""""""""""""""""""""""
"コメント以外で全角スペースを指定しているので、scriptencodingと、
"このファイルのエンコードが一致するよう注意！
"強調表示されない場合、ここでscriptencodingを指定するとうまくいく事があります。
"scriptencoding cp932
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=Red gui=underline guifg=Red
    "全角スペースを　明示的に表示する
    "silent! match ZenkakuSpace /　/
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd VimEnter,BufEnter * call ZenkakuSpace()
    augroup END
endif

" 行末の空白文字をハイライト
augroup HighlightTrailingSpaces
    autocmd!
    autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
    autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

""""""""""""""""""""""""""""""
" create directory automatically
""""""""""""""""""""""""""""""
augroup vimrc-auto-mkdir
    autocmd!
    autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
    function! s:auto_mkdir(dir, force)
        if !isdirectory(a:dir) && (a:force ||
            \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
            call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
        endif
    endfunction
augroup END

""""""""""""""""""""""""""""""
"grep,tagsのためカレントディレクトリをファイルと同じディレクトリに移動する
""""""""""""""""""""""""""""""
"if exists('+autochdir')
"    "autochdirがある場合カレントディレクトリを移動
"    set autochdir
"else
"    "autochdirが存在しないが、カレントディレクトリを移動したい場合
"    au BufEnter * execute ":silent! lcd " . escape(expand("%:p:h"), ' ')
"endif

" 各種プラグイン設定 {{{1
"----------------------------------------

" dein設定 {{{1
"----------------------------------------
augroup MyAutoCmd
    autocmd!
augroup END

let s:dein_cache_dir = $HOME. '/.cache/dein'
let s:dein_config_dir = $HOME. '/.config/nvim'
let s:dein_repo_name = 'Shougo/dein.vim'
let s:dein_repo_dir = s:dein_cache_dir. '/repos/github.com/'. s:dein_repo_name

" check dein.vim has beein installed or not
if !isdirectory(s:dein_repo_dir)
    echo "dein is not installed -> install now"
    let s:dein_repo = "https://github.com/". s:dein_repo_name
    echo "git clone ". s:dein_repo. " ". s:dein_repo_dir
    call system("git clone ". s:dein_repo. " ". s:dein_repo_dir)
endif
let &runtimepath = &runtimepath. ','. s:dein_repo_dir

" begin loading plugins
if dein#load_state(s:dein_cache_dir)
    let s:toml = s:dein_config_dir. '/dein.toml'
    let s:toml_lazy = s:dein_config_dir. '/dein_lazy.toml'

    call dein#begin(s:dein_cache_dir)
    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:toml_lazy, {'lazy': 1})
    call dein#end()
    call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
    call dein#install()
endif

filetype plugin indent on
syntax enable

" 自動的にQuickfix-Windowで開く {{{1
autocmd QuickFixCmdPost *grep* cwindow

" コメント中の特定の単語を強調表示する {{{1
augroup HilightsForce
  autocmd!
  autocmd WinEnter,BufRead,BufNew,Syntax * :silent! call matchadd('Todo', '\(TODO\|NOTE\|FIXME\|BUG\):')
  autocmd WinEnter,BufRead,BufNew,Syntax * highlight Todo guibg=Red guifg=White
augroup END

" VCS command {{{1
if executable('hg')
    let g:VCSCommandHGExec = 'hg'
elseif executable('C:\app\TortoiseHg\hg.exe')
    let g:VCSCommandHGExec = 'C:\app\TortoiseHg\hg.exe'
elseif executable('/c/app/TortoiseHg/hg.exe')
    let g:VCSCommandHGExec = '/c/app/TortoiseHg/hg.exe'
endif

if executable('git')
    let g:VCSCommandGitExec = 'git'
elseif executable('C:\app\Git\bin\git.exe')
    let g:VCSCommandHGExec = 'C:\app\Git\bin\git.exe'
elseif executable('/c/app/Git/git.exe')
    let g:VCSCommandHGExec = '/c/app/Git/git.exe'
endif

" vim-indent-guides <Leader>igで起動 {{{1
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#121212 ctermbg=233
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#1C1C1C ctermbg=235
"let g:indent_guides_enable_on_vim_startup = 0
"let g:indent_guides_guide_size = 1

" ctags {{{1
nnoremap <C-]> g<C-]>
set tags=.tags;$HOME

" Template {{{1
"----------------------------------------
"augroup SkeletonAu
"    autocmd!
"    autocmd BufNewFile *.py 0r $HOME/vimfiles/templates/skel.py
"augroup END

" 一時設定 {{{1
"----------------------------------------

" end of file {{{1
" vi:ft=vim:et:ts=4:nowrap:fdm=marker
