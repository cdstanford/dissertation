.PHONY: view build clean
.DEFAULT_GOAL: view

view: build
	open src/dissertation.pdf

build:
	$(MAKE) -C src build

clean:
	$(MAKE) -C src clean
