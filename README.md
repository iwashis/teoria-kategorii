# Teoria kategorii — notatki z wykładów

Złożona w LaTeX-u transkrypcja 13 odręcznych wykładów z teorii kategorii,
wraz z rozdziałem zbierającym wszystkie serie zadań z kursu.
Wynikiem kompilacji jest pojedynczy PDF w formie książki (`Wyklady.pdf`, ok. 45 stron).

## Pliki

| Plik | Przeznaczenie |
|---|---|
| `Wyklady.tex` | Dokument główny — preambuła, style twierdzeń, struktura rozdziałów |
| `body1.tex` … `body12.tex`, `body14.tex` | Treść poszczególnych wykładów, dołączana przez `\input{}` |
| `body_zadania.tex` | Rozdział „Zadania” — wszystkie 5 serii, dołączany przez `\input{}` |
| `tk1.tex` … `tk5.tex` | Oryginalne, samodzielne pliki źródłowe serii zadań (proweniencja / materiał źródłowy) |
| `Wyklady.pdf` | Skompilowany wynik |

Numeracja wykładów pomija 13: w materiale źródłowym nie było wykładu 13
(zajęcia online, brak notatek). Numeracja rozdziałów w PDF-ie jest ciągła:
rozdziały 1–13 to wykłady, a rozdział 14 to „Zadania”.

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

## Ostrzeżenia przy kompilacji

Dwie niegroźne linie `\let\…\relax` w preambule wyciszają konflikty nazw
między `newtxmath` a `amssymb`/`xcolor` (dotyczące `\Bbbk`, `\openbox`, `\Top`).
Jeśli je usuniesz i użyjesz innego fontu matematycznego, mogą nie być potrzebne.

## Uwagi o silniku

- Dokument jest przygotowany pod **`pdflatex`** (nie XeLaTeX/LuaLaTeX).
  Kombinacja `libertine`/`newtxmath` działa w `pdflatex`, ponieważ używamy
  wersji Type-1 w kodowaniu T1.
- Linia `\AtBeginDocument{\shorthandoff{"}}` wyłącza aktywny znak `"`
  z `babel-polish`, dzięki czemu działają etykiety strzałek w `tikz-cd`
  (`\arrow[r, "f"]`). Nie usuwaj jej, chyba że zastąpisz wszystkie
  etykiety z `"` w diagramach.

## Wskazówki edycyjne

- **Dodanie rozdziału:** utwórz `bodyN.tex`, a następnie dodaj blok
  `\chapter{...} \input{bodyN}` w `Wyklady.tex`.
- **Środowiska twierdzeń** są zdefiniowane w preambule: `definicja`,
  `twierdzenie`, `lemat`, `wniosek`, `stwierdzenie`, `przyklad`, `uwaga`,
  `fakt`. Każde dostaje kolorowy pasek z lewej strony (niebieski / fioletowy /
  zielony / szary).
- **Makra kategorii**: `\Set`, `\Setf`, `\Cat`, `\C`, `\D`, `\Grp`, `\Ab`,
  `\Top`, `\Vect`, `\Mon`, `\Ring`, `\Pos`, `\Rel`, `\Par`, `\Err`, `\Trace`,
  `\Kl`. Operatory: `\Hom`, `\Ker`, `\Img`, `\dom`, `\cod`, `\id`, `\Id`,
  `\op`, `\Ob`, `\Mor`. Funktory: `\IO`, `\State`.
- **Diagramy przemienne** są rysowane w `tikz-cd`. Jeśli ukośna strzałka
  celuje w pustą komórkę, umieść w niej znak-wypełniacz `{}`, aby komórka
  miała nazwany kształt, albo użyj dłuższego kierunku (np. `[ddrr]` zamiast
  `[ddr]`, gdy pośredni wiersz jest pusty).

## Proweniencja

Transkrypcja na podstawie `wyklad1.pdf` … `wyklad12.pdf`, `Wykład14.PDF.pdf`
(skany odręcznych notatek tablicowych z Politechniki Warszawskiej).
Rozdział o kategoriach Kleisliego został napisany od zera — oryginalnym
źródłem tego wykładu jest pojedyncza, fragmentaryczna strona; rozdział
rozwija konstrukcję w całości, z dowodami i pięcioma opracowanymi
przykładami (`Maybe` → funkcje częściowe, `(−) + M` → Err,
`M × (−)` → Trace, `P` → Rel, `State_A`).

Nieczytelne fragmenty rękopisu zostały zrekonstruowane zgodnie ze standardową
interpretacją teoriokategoryjną. Przed wykorzystaniem materiału w nauczaniu
zweryfikuj poprawność matematyczną.
