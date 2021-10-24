.PHONY: build clean

build:
	pdflatex dissertation.tex
	bibtex Main.aux
	bibtex dissertation.aux
	pdflatex dissertation.tex
	pdflatex dissertation.tex

clean:
	rm *.aux *.toc *.out *.log *.bbl *.blg *.pdf
