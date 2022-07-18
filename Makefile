.PHONY: view build aux spellcheck full clean
.DEFAULT_GOAL: view

view: build
	open src/dissertation.pdf

build:
	@echo "src/ ---> make build"
	@$(MAKE) -C src build 2>&1 | sed 's_^_    _'

aux:
	scripts/update_progress.sh
	scripts/update_wordclouds.sh

spellcheck:
	scripts/spellcheck.sh

full: clean aux spellcheck build

clean:
	rm -f src/ALL.tex.temp
	@echo "src/ ---> make clean"
	@$(MAKE) -C src clean 2>&1 | sed 's_^_    _'
