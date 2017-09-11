# dotfiles

## Reference <!-- {{{1 -->

* <http://qiita.com/b4b4r07/items/b70178e021bef12cd4a2>

## directory structure <!-- {{{1 -->

```
dotfiles
 |
 |- .config
 |   |
 |   \- nvim <- Neovim config files
 |
 |- bin <- own scripts, binaries
 |- etc <- setting script files
 |   |
 |   |- init <- initialisation scripts for install
 |   |- lib <- library files
 |   \- test <- test files for initialisation scripts or dotfiles
 |
 |- doc <- documentation, manual, etc... not "bin" or "etc" files
 |
 |- Makefile
 |- .zshrc
 |- .tmux.conf
 \- ...
```

## Installation <!-- {{{1 -->

1. git clone
1. make deploy
1. (option) make init

<!-- end of file {{{1
vim:ft=markdown:et:ts=4:fdm=marker
-->

