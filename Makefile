.PHONY: view build stats fonts aux spellcheck full clean
.DEFAULT_GOAL: view

view: build
	open src/dissertation.pdf

build:
	@echo "src/ ---> make build"
	@$(MAKE) -C src build 2>&1 | sed 's_^_    _'

stats:
	scripts/update_progress.sh
	scripts/update_bibentries.sh
	scripts/update_wordclouds.sh

fonts: build
	scripts/update_fonts.sh

aux: stats fonts

spellcheck:
	scripts/spellcheck.sh

full: clean spellcheck stats build fonts

clean:
	@echo "src/ ---> make clean"
	@$(MAKE) -C src clean 2>&1 | sed 's_^_    _'
