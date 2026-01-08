all: lint

sync: 
	bash scripts/sync-eosp.sh

spell:
	-cspell-cli "**/*.{md,tex}"

lint:
	markdownlint-cli2 . --fix
	chktex ./**/*.tex
