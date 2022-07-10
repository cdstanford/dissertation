.PHONY: view build clean update-aux
.DEFAULT_GOAL: view

view: build
	open src/dissertation.pdf

build:
	$(MAKE) -C src build

update-aux:
	scripts/update_progress.sh
	scripts/update_wordcloud.sh

clean:
	rm src/ALL.tex.temp
	$(MAKE) -C src clean
