" Anywhere SID. {{{1
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline. {{{1
function! s:my_tabline()
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'

" Always display tab line
"set showtabline=2

" The prefix key. {{{1
nnoremap [Tag] <Nop>
nmap t [Tag]
" Tab jump: jump to most left tab by `t1`, 2nd left tab by `t2`.
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" tc: create new tab on most right
map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tx: close tab
map <silent> [Tag]x :tabclose<CR>
" tn: move to next tab
map <silent> [Tag]n :tabnext<CR>
" tp: move to previous tab
map <silent> [Tag]p :tabprevious<CR>

" end of file {{{1
" vim:ft=vim:et:nowrap:fdm=marker
