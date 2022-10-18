IMG=neovim-latest

CONFIGDIR=/home/admin/.config/nvim

TAGS= -it
TAGS+= --rm
TAGS+= -v $(PWD)/configs/:$(CONFIGDIR)

build:
	docker build -t $(IMG) .

run:
	docker run -it --rm $(TAGS) $(IMG)

all: build run

bash: build
	docker run $(TAGS) $(IMG) /bin/bash
