.PHONY: view build pre post aux spellcheck full clean
.DEFAULT_GOAL: view

view: build
	open build/dissertation.pdf

build:
	cp -R src/ build/
	@echo "build/ ---> make build"
	@$(MAKE) -C build build 2>&1 | sed 's_^_    _'

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
	cp build/dissertation.pdf final/

clean:
	rm -rf build/
	rm -f data/*.temp
