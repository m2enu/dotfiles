" compatible {{{1
if &compatible
    set nocompatible
endif

" python setting {{{1
let g:python_host_prog = $PYTHON2_HOST_PROG
let g:python3_host_prog = $PYTHON3_HOST_PROG
let g:python_highlight_all = 1

" reset augroup {{{1
augroup MyAutoCmd
    autocmd!
augroup END

" load keymap {{{1
runtime! keymap.rc.vim

" dein.vim {{{1
let s:dein_cache_dir = $HOME. '/.cache/dein'
let s:dein_config_dir = $XDG_CONFIG_HOME. '/nvim'
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
    let s:toml_main = s:dein_config_dir. '/dein.toml'
    let s:toml_defx = s:dein_config_dir. '/dein_defx.toml'
    let s:toml_lazy = s:dein_config_dir. '/dein_lazy.toml'

    call dein#begin(s:dein_cache_dir)
    call dein#load_toml(s:toml_main, {'lazy': 0})
    call dein#load_toml(s:toml_defx, {'lazy': 0})
    call dein#load_toml(s:toml_lazy, {'lazy': 1})
    call dein#end()
    call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
    call dein#install()
endif

filetype plugin indent on
syntax enable

" load other settings {{{1
runtime! options.rc.vim
runtime! autocmd.rc.vim
runtime! tab.rc.vim

" end of file {{{1
" vim:ft=vim:et:nowrap:fdm=marker
