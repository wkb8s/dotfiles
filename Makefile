# Do everything.
all: link defaults brew

# Set initial preference.
init: start link defaults brew setup

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

setup:
	bin/setup.sh
