.PHONY: view build aux full clean
.DEFAULT_GOAL: view

view: build
	open src/dissertation.pdf

build:
	$(MAKE) -C src build

aux:
	scripts/update_progress.sh
	scripts/update_wordclouds.sh

full: aux build

clean:
	rm src/ALL.tex.temp
	$(MAKE) -C src clean
