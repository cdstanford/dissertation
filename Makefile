.PHONY: view build aux spellcheck full clean
.DEFAULT_GOAL: view

view: build
	open src/dissertation.pdf

build:
	$(MAKE) -C src build

aux:
	scripts/update_progress.sh
	scripts/update_wordclouds.sh

spellcheck:
	scripts/spellcheck.sh

full: clean aux spellcheck build

clean:
	rm src/ALL.tex.temp
	$(MAKE) -C src clean
