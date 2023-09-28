# Do everything.
all: link defaults update

# Set initial preference.
init: start link defaults update setup

start:
	bin/start.sh

# Link dotfiles.
link:
	bin/link.sh

# Set macOS system preferences.
defaults:
	bin/defaults.sh

update:
	bin/update.sh

setup:
	bin/setup.sh
