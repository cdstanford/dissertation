.PHONY: build clean show-input-files

SRC_FILES = $(wildcard *.tex)
BIB_FILES = $(wildcard *.bib)
FIG_FILES = $(wildcard figures/*/*.pdf)
IMG_FILES = $(wildcard img/*) $(wildcard img/*/*)

build: dissertation.pdf

show-input-files:
	@echo "=== tex sources ==="
	@echo $(SRC_FILES)
	@echo "=== bib ==="
	@echo $(BIB_FILES)
	@echo "=== figures ==="
	@echo $(FIG_FILES)
	@echo "=== images ==="
	@echo $(IMG_FILES)

dissertation.pdf: $(SRC_FILES) $(BIB_FILES) $(FIG_FILES) $(IMG_FILES)
	pdflatex -interaction=nonstopmode -halt-on-error dissertation.tex > /dev/null
	bibtex --terse Main.aux
	bibtex --terse dissertation.aux
	pdflatex dissertation.tex > /dev/null
	texfot pdflatex dissertation.tex

clean:
	rm *.aux *.toc *.out *.log *.bbl *.blg *.pdf *.temp
