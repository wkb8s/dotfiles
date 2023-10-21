# Update & Clean up
all: link defaults update

# Initial Setting
init: init_install link defaults update setup

init_install:
	./init_install.sh

link:
	./link.sh

defaults:
	./defaults.sh

update:
	./update.sh

setup:
	./setup.sh
