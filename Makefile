# Kompilacja notatek z teorii kategorii.
#   make            -- przebuduj PDF (tylko gdy źródła się zmieniły)
#   make watch      -- tryb ciągły: przebudowa przy każdym zapisie pliku
#   make clean      -- usuń pliki pomocnicze (zostawia PDF)
#   make distclean  -- usuń pliki pomocnicze oraz PDF

TEX  = Wyklady
SRCS = $(TEX).tex $(wildcard body*.tex)

all: $(TEX).pdf

$(TEX).pdf: $(SRCS)
	latexmk -pdf $(TEX).tex

watch:
	latexmk -pdf -pvc $(TEX).tex

clean:
	latexmk -c

distclean:
	latexmk -C

.PHONY: all watch clean distclean
