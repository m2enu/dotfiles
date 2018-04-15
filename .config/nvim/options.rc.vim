" backups {{{1
set nowritebackup
set nobackup
set noswapfile
set noundofile

" colors {{{1
if has('patch-7.4.1778')
"    set guicolors
endif
if has('termguicolors')
    set termguicolors
endif
if has('nvim')
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" syntax highlight {{{1
syntax enable

" IME off in insert mode {{{1
set iminsert=0
set imsearch=-1

" display {{{1
set display=lastline
set list
set listchars=tab:>-,extends:<,trail:_
set ruler
set nowrap
set colorcolumn=80

" visual bell {{{1
set noerrorbells
set novisualbell
set visualbell t_vb=

" scroll {{{1
set scrolloff=2

" bracket {{{1
set showmatch matchtime=1
set matchpairs& matchpairs+=<:>

" tab {{{1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set shiftround

" indent {{{1
set autoindent
set nosmartindent
set nocindent

" command line {{{1
set cmdheight=2
set laststatus=2
set showcmd

" edit {{{1
set backspace=indent,eol,start
set ambiwidth=double
set clipboard+=unnamedplus
set virtualedit=block
set nrformats-=octal
set formatoptions+=mM

" search {{{1
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch
set infercase

" other {{{1
set wildmenu
set wildignorecase
set tw=0
set whichwrap=b,s,h,l,<,>,[,]
set hidden
set switchbuf=useopen
set nostartofline
set history=50

" end of file {{{1
" vim:ft=vim:et:nowrap:fdm=marker
