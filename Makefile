.PHONY: view build show-input-files pre post aux spellcheck full clean
.DEFAULT_GOAL: view

SRC_FILES = $(wildcard src/*.tex)
BIB_FILES = $(wildcard src/*.bib)
FIG_FILES = $(wildcard src/figures/*/*.pdf)
IMG_FILES = $(wildcard src/img/*) $(wildcard src/img/*/*)

PDFLATEX_EXIT = -interaction=nonstopmode -halt-on-error

view: build
	open build/dissertation.pdf

build: build/dissertation.pdf

build/dissertation.pdf: $(SRC_FILES) $(BIB_FILES) $(FIG_FILES) $(IMG_FILES)
	cp -R src/ build/
	cd build \
		&& pdflatex $(PDFLATEX_EXIT) dissertation.tex > /dev/null \
		&& bibtex --terse Main.aux | sed 's_^_    _' \
		&& bibtex --terse dissertation.aux | sed 's_^_    _' \
		&& pdflatex dissertation.tex > /dev/null \
		&& texfot pdflatex dissertation.tex | sed 's_^_    _' \

show-input-files:
	@echo "=== tex sources ==="
	@echo $(SRC_FILES)
	@echo "=== bib ==="
	@echo $(BIB_FILES)
	@echo "=== figures ==="
	@echo $(FIG_FILES)
	@echo "=== images ==="
	@echo $(IMG_FILES)

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

# Separating out build/ simplifies this!
# We no longer have to enumerate a long list of TeX-related files, like:
# rm -f *.aux *.toc *.out *.log *.bbl *.blg *.pdf *.temp *.lof *.lot
clean:
	rm -rf build/
	rm -f data/*.temp
