DOTFILE_NAME := "dotfiles"
DOTFILE_PATH := $(HOME)/$(DOTFILE_NAME)
DOTFILE_URL := "https://raw.githubusercontent.com/rixycf/dotfiles/master/etc/install.sh"

test:
	@echo $(DOTFILE_PATH)

init:
	@echo "download dotfiles from rixycf/dotfiles ..."
	curl $(DOTFILE_URL) | sh
	@echo "end!"

clean:
	# rm -rf $(DOTFILE_PATH)
	@echo "delete dotfiles dir..."
