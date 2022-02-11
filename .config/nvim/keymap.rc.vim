" map prefix {{{1
let g:mapleader = ";"
nnoremap <Leader>   <Nop>
xnoremap <Leader>   <Nop>
"nnoremap [dev]      <Nop>
"xnoremap [dev]      <Nop>
"nmap     m          [dev]
"xmap     m          [dev]
"nnoremap [ff]       <Nop>
"xnoremap [ff]       <Nop>
"nmap     z          [ff]
"xmap     z          [ff]

" normal mode {{{1
nnoremap <Down> gj
nnoremap <Up> gk
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
nnoremap l <Right>
if has('folding')
    nnoremap <expr> l foldlevel(line('.')) ? "\<Right>zo" : "\<Right>"
endif

" insert mode {{{1
inoremap <silent> <C-p> <Up>
inoremap <silent> <C-n> <Down>
inoremap <silent> <C-b> <Left>
inoremap <silent> <C-f> <Right>
inoremap <silent> <C-a> <Home>
inoremap <silent> <C-e> <End>
inoremap <silent> <C-d> <Del>
inoremap <silent> <C-k> <Esc>lDa
inoremap <silent> <C-y> <Esc>Pa
inoremap <silent> <C-u> <Esc>d0xi

" command mode {{{1
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Delete>
cnoremap <C-h> <BS>
cnoremap <C-y> <C-r>"
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>

" end of file {{{1
" vim:ft=vim:et:nowrap:fdm=marker
