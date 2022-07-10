.PHONY: view build aux clean
.DEFAULT_GOAL: view

view: build
	open src/dissertation.pdf

build:
	$(MAKE) -C src build

aux:
	scripts/update_progress.sh
	scripts/update_wordclouds.sh

clean:
	rm src/ALL.tex.temp
	$(MAKE) -C src clean
