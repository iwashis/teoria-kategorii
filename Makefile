# Kompilacja notatek z teorii kategorii.
#   make            -- przebuduj PDF (tylko gdy źródła się zmieniły)
#   make slides     -- zbuduj prezentację (Prezentacja.pdf)
#   make watch      -- tryb ciągły: przebudowa przy każdym zapisie pliku
#   make clean      -- usuń pliki pomocnicze (zostawia PDF)
#   make distclean  -- usuń pliki pomocnicze oraz PDF

TEX  = Wyklady
SRCS = $(TEX).tex $(wildcard body*.tex)

all: $(TEX).pdf

$(TEX).pdf: $(SRCS)
	latexmk -pdf $(TEX).tex

slides: Prezentacja.pdf

Prezentacja.pdf: Prezentacja.tex
	latexmk -pdf Prezentacja.tex

watch:
	latexmk -pdf -pvc $(TEX).tex

clean:
	latexmk -c
	latexmk -c Prezentacja.tex

distclean:
	latexmk -C
	latexmk -C Prezentacja.tex

.PHONY: all slides watch clean distclean
