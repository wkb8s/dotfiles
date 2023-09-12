# Do everything.
all: link defaults brew update

# Set initial preference.
init: start link defaults brew update setup

start:
	bin/start.sh

# Link dotfiles.
link:
	bin/link.sh

# Set macOS system preferences.
defaults:
	bin/defaults.sh

# Install macOS applications.
brew:
	bin/brew.sh

update:
	bin/update.sh

setup:
	bin/setup.sh
