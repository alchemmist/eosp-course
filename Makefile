TEXFILES := $(wildcard syllabus/*.tex)
SLIDES := $(wildcard slides/*-lecture.md)
PDFDIR := pdf

all: lint

sync:
	bash scripts/sync-eosp.sh

spell:
	-cspell-cli "**/*.{md,tex}"

lint:
	markdownlint-cli2 . --fix
	chktex $(TEXFILES)

build: $(PDFDIR)
	for f in $(TEXFILES); do \
		pdflatex -interaction=nonstopmode -output-directory=syllabus "$$f"; \
	done
	for s in $(SLIDES); do \
		base=$$(basename $$s .md).pdf; \
		cd slides && yarn run slidev export --format pdf --output "$$base" "$$(basename $$s)"; \
	done
	mv syllabus/*.pdf $(PDFDIR) 2>/dev/null || true
	mv slides/*.pdf $(PDFDIR) 2>/dev/null || true

$(PDFDIR):
	mkdir -p $(PDFDIR)

clean:
	rm -f syllabus/*.aux syllabus/*.log syllabus/*.toc syllabus/*.out syllabus/*.pdf
	rm -rf $(PDFDIR)/*
