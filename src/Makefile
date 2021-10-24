.PHONY: build clean
.DEFAULT_GOAL: build

build:
	pdflatex proposal.tex
	bibtex Main.aux
	bibtex proposal.aux
	pdflatex proposal.tex
	pdflatex proposal.tex

clean:
	rm *.aux *.toc *.out *.log *.bbl *.blg *.pdf
