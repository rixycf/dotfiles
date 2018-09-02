DOTFILE_NAME := dotfiles
DOTFILE_PATH := $(HOME)/$(DOTFILE_NAME)
DOTFILE_URL := https://raw.githubusercontent.com/rixycf/dotfiles/master/etc/install.sh

CANDIDATES := $(wildcard $(DOTFILE_PATH)/.??*) 
EXCLUSIONS := .DS_Store .git .gitmodules .gitignore
DOTFILES := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

show_list:
	@echo $(DOTFILES)

test:
	@echo $(DOTFILE_PATH)
	@echo $(EXCLUSIONS)
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

init:
	@echo "download dotfiles from rixycf/dotfiles ..."
	curl $(DOTFILE_URL) | sh
	@echo "end!"

clean:
	# rm -rf $(DOTFILE_PATH)
	@echo "delete dotfiles dir..."
