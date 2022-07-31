.PHONY: view build pre post aux spellcheck full clean
.DEFAULT_GOAL: view

view: build
	open src/dissertation.pdf

build:
	@echo "src/ ---> make build"
	@$(MAKE) -C src build 2>&1 | sed 's_^_    _'

pre:
	scripts/update_progress.sh
	scripts/update_wordclouds.sh

post: build
	scripts/update_bibentries.sh || true
	scripts/update_fonts.sh

aux: pre post

spellcheck:
	scripts/spellcheck.sh

full: clean spellcheck pre build post
	cp src/dissertation.pdf final/

clean:
	@echo "src/ ---> make clean"
	@$(MAKE) -C src clean 2>&1 | sed 's_^_    _'
