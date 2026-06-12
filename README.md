# Teoria kategorii — notatki z wykładów

Złożona w LaTeX-u transkrypcja 13 odręcznych wykładów z teorii kategorii,
wraz z rozdziałem zbierającym wszystkie serie zadań z kursu.
Wynikiem kompilacji jest pojedynczy PDF w formie książki (`Wyklady.pdf`, ok. 46 stron).

## Pliki

| Plik | Przeznaczenie |
|---|---|
| `Wyklady.tex` | Dokument główny — preambuła, style twierdzeń, struktura rozdziałów |
| `body1.tex` … `body13.tex` | Treść poszczególnych wykładów, dołączana przez `\input{}` |
| `body_zadania.tex` | Rozdział „Zadania” — wszystkie 5 serii, dołączany przez `\input{}` |
| `tk1.tex` … `tk5.tex` | Oryginalne, samodzielne pliki źródłowe serii zadań (proweniencja / materiał źródłowy) |
| `Wyklady.pdf` | Skompilowany wynik |

13 wykładów jest zebranych w 8 rozdziałów (niektóre rozdziały łączą kilka
kolejnych wykładów jako sekcje), a ostatni rozdział „Z” to „Zadania”.

Pliki `tk*.tex` **nie** wchodzą w skład kompilacji — `body_zadania.tex` zawiera
te same zadania złożone na nowo w stylu książki, ze znormalizowanymi makrami.
Pliki `tk*.tex` pozostają w repozytorium, aby katalog był samowystarczalny
i aby oryginalne treści zadań dało się również skompilować samodzielnie
(każdy `tk*.tex` jest osobnym dokumentem klasy `amsart`).

## Wymagania

- **Dystrybucja TeX-a** z kolekcjami `latex-extra` / `science`.
  Testowane na **TeX Live 2025** (macOS, przez `brew install --cask mactex`
  lub `brew install texlive`).
- Zainstalowane muszą być następujące pakiety LaTeX-a (wszystkie są w standardowym TeX Live):
  - `scrbook` (KOMA-Script)
  - `libertine`, `newtxmath`, `beramono` — fonty
  - `babel-polish` — polskie przenoszenie wyrazów i skróty
  - `microtype`, `geometry`, `scrlayer-scrpage`, `parskip`
  - `amsmath`, `amssymb`, `amsthm`, `mathtools`
  - `tikz`, `tikz-cd`
  - `xcolor`, `tcolorbox` (z biblioteką `most`)
  - `enumitem`, `hyperref`

  Na Linuksie: `sudo apt install texlive-full` (Debian/Ubuntu) pokrywa wszystko.
  Na macOS z MacTeX-em wszystko jest preinstalowane.

## Jak skompilować

Najprościej przez dołączony `Makefile`:

```bash
make            # przebuduj PDF (tylko gdy źródła się zmieniły)
make watch      # tryb ciągły: przebudowa przy każdym zapisie pliku
make clean      # usuń pliki pomocnicze (zostawia PDF)
make distclean  # usuń pliki pomocnicze oraz PDF
```

Ręcznie: uruchom `pdflatex` **dwukrotnie** z tego katalogu, aby spis treści
i hiperłącza zostały poprawnie rozwiązane:

```bash
cd /sciezka/do/Wyklady
pdflatex Wyklady.tex
pdflatex Wyklady.tex
```

Lub za pomocą `latexmk` (jedno polecenie, samo obsługuje ponowne przebiegi):

```bash
latexmk -pdf Wyklady.tex
```

Aby po kompilacji usunąć pliki pomocnicze:

```bash
rm -f Wyklady.aux Wyklady.log Wyklady.out Wyklady.toc
# lub, jeśli używasz latexmk:
latexmk -c
```
