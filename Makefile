DOTFILES_EXCLUDES := .DS_Store .config .git .gitignore .gitmodules .travis.yml
DOTFILES_TARGET   := $(wildcard .??*) .config/nvim
DOTFILES_DIR      := $(PWD)
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))

deploy:
	@$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

init:
	@$(foreach val, $(wildcard ./etc/init/*.sh), bash $(val);)
