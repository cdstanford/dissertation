.PHONY: build clean
.DEFAULT_GOAL: build

build:
	$(MAKE) -C src build

clean:
	$(MAKE) -C src clean
