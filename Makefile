.PHONY: view build progress wordclouds fonts aux spellcheck full clean
.DEFAULT_GOAL: view

view: build
	open src/dissertation.pdf

build:
	@echo "src/ ---> make build"
	@$(MAKE) -C src build 2>&1 | sed 's_^_    _'

progress:
	scripts/update_progress.sh

wordclouds:
	scripts/update_wordclouds.sh

fonts: build
	scripts/update_fonts.sh

aux: progress wordclouds fonts

spellcheck:
	scripts/spellcheck.sh

full: clean spellcheck progress wordclouds build fonts

clean:
	@echo "src/ ---> make clean"
	@$(MAKE) -C src clean 2>&1 | sed 's_^_    _'
