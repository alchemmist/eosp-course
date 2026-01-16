TEXFILES := $(wildcard syllabus/*.tex)
SLIDES := $(wildcard slides/*-lecture.md)
PDFDIR := pdf
LECTURE_PAGES := pages/lectures

all: lint

sync:
	bash scripts/sync-eosp.sh

spell:
	-cspell-cli "**/*.{md,tex}"

lint:
	markdownlint-cli2 . --fix
	chktex $(TEXFILES)

build: $(PDFDIR) $(LECTURE_PAGES)
	for f in $(TEXFILES); do \
		pdflatex -interaction=nonstopmode -output-directory=syllabus "$$f"; \
	done
	for s in $(SLIDES); do \
		base=$$(basename $$s .md); \
		cd slides && yarn run slidev export --format pdf --output "../$(PDFDIR)/$$base.pdf" "$$(basename $$s)"; \
	done
	for s in $(SLIDES); do \
		base=$$(basename $$s .md); \
		outdir="../$(LECTURE_PAGES)/$$base"; \
		mkdir -p $$outdir; \
		cd slides && yarn run slidev build --out $$outdir --base /eosp/lectures/$$base/ "$$(basename $$s)"; \
	done

$(PDFDIR):
	mkdir -p $(PDFDIR)

$(LECTURE_PAGES):
	mkdir -p $(LECTURE_PAGES)

clean:
	rm -f syllabus/*.aux syllabus/*.log syllabus/*.toc syllabus/*.out syllabus/*.pdf
	rm -rf $(PDFDIR)/*
	rm -rf $(LECTURE_PAGES)/*
