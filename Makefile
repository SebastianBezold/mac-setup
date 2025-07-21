.PHONY: install
install:
	brew bundle install --file=Brewfile

.PHONY: brew-dump
brew-dump:
	brew bundle dump --force --file=Brewfile
