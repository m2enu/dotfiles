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

" command mode {{{1
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Delete>
cnoremap <C-h> <BS>
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>

" end of file {{{1
" vim:ft=vim:et:nowrap:fdm=marker
