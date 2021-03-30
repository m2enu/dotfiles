" display zenkaku space {{{1
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=Red gui=underline guifg=Red
    "silent! match ZenkakuSpace /　/
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd VimEnter,BufEnter * call ZenkakuSpace()
    augroup END
endif

" highlight trailing spaces {{{1
augroup HighlightTrailingSpaces
    autocmd!
    autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
    autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" automatically open quickfix window {{{1
autocmd QuickFixCmdPost *grep* cwindow

" move last cursor position {{{1
augroup MoveLastPosition
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line('$') |
        \   exe "normal! g`\"" |
        \ endif
augroup END

" specify filetype manually {{{1
autocmd BufRead,BufNewFile *.800 setfiletype asm
autocmd BufRead,BufNewFile *.850 setfiletype asm
autocmd BufRead,BufNewFile *.rec setfiletype srec

" end of file {{{1
" vim:ft=vim:et:nowrap:fdm=marker
