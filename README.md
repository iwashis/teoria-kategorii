# Teoria kategorii — notatki z wykładów

Typeset LaTeX transcription of 13 handwritten lectures on Category Theory,
plus a chapter collecting all problem sets from the course.
Outputs a single book-style PDF (`Wyklady.pdf`, ~44 pages).

## Files

| File | Purpose |
|---|---|
| `Wyklady.tex` | Master document — preamble, theorem styles, chapter structure |
| `body1.tex` … `body12.tex`, `body14.tex` | Per-lecture content, included via `\input{}` |
| `body_zadania.tex` | Chapter "Zadania" — all 5 problem sets, included via `\input{}` |
| `tk1.tex` … `tk5.tex` | Original standalone problem-set source files (provenance / reference) |
| `Wyklady.pdf` | Compiled output |

The lecture numbering skips 13: the original source had no lecture 13 (online session, no notes).
Chapter numbering in the PDF is contiguous: chapters 1–13 are lectures and chapter 14 is "Zadania".

The `tk*.tex` files are **not** inputs to the build — `body_zadania.tex` contains the same problems re-rendered in the book's house style with normalized macros. The `tk*.tex` files are kept here so the folder is self-contained and so the original problem statements can also be compiled standalone (each `tk*.tex` is its own `\documentclass{amsart}` document).

## Requirements

- **A TeX distribution** with the `latex-extra` / `science` collections.
  Tested on **TeX Live 2025** (macOS, via `brew install --cask mactex` or
  `brew install texlive`).
- The following LaTeX packages must be installed (all are in standard TeX Live):
  - `scrbook` (KOMA-Script)
  - `libertine`, `newtxmath`, `beramono` — fonts
  - `babel-polish` — Polish hyphenation and shorthands
  - `microtype`, `geometry`, `scrlayer-scrpage`, `parskip`
  - `amsmath`, `amssymb`, `amsthm`, `mathtools`
  - `tikz`, `tikz-cd`
  - `xcolor`, `tcolorbox` (with the `most` library)
  - `enumitem`, `hyperref`

  On Linux: `sudo apt install texlive-full` (Debian/Ubuntu) covers everything.
  On macOS with MacTeX, all are pre-installed.

## How to compile

Run `pdflatex` **twice** from this directory so the table of contents and
hyperlinks resolve:

```bash
cd /path/to/Wyklady
pdflatex Wyklady.tex
pdflatex Wyklady.tex
```

Or with `latexmk` (single command, handles re-runs automatically):

```bash
latexmk -pdf Wyklady.tex
```

To remove auxiliary files after compilation:

```bash
rm -f Wyklady.aux Wyklady.log Wyklady.out Wyklady.toc
# or, if using latexmk:
latexmk -c
```

## Compile-time warnings

Two harmless `\let\…\relax` lines in the preamble silence name conflicts
between `newtxmath` and `amssymb`/`xcolor` (over `\Bbbk`, `\openbox`, `\Top`).
If you remove them and use a different math font, you may not need them.

## Engine notes

- The document is built for **`pdflatex`** (not XeLaTeX/LuaLaTeX). The
  `libertine`/`newtxmath` combination works in `pdflatex` because we use the
  T1-encoded Type-1 versions.
- The line `\AtBeginDocument{\shorthandoff{"}}` disables `babel-polish`'s
  active `"` so that `tikz-cd` arrow labels (`\arrow[r, "f"]`) work. Do not
  remove unless you replace all `"`-labels in the diagrams.

## Editing tips

- **Adding a chapter:** create `bodyN.tex`, then add a `\chapter{...} \input{bodyN}`
  block in `Wyklady.tex`.
- **Theorem environments** are defined in the preamble: `definicja`,
  `twierdzenie`, `lemat`, `wniosek`, `stwierdzenie`, `przyklad`, `uwaga`,
  `fakt`. Each gets a colored left accent bar (blue / purple / green / gray).
- **Category macros**: `\Set`, `\Setf`, `\Cat`, `\C`, `\D`, `\Grp`, `\Ab`,
  `\Top`, `\Vect`, `\Mon`, `\Ring`, `\Pos`, `\Rel`, `\Par`, `\Err`, `\Trace`,
  `\Kl`. Operators: `\Hom`, `\Ker`, `\Img`, `\dom`, `\cod`, `\id`, `\Id`,
  `\op`, `\Ob`, `\Mor`. Functors: `\IO`, `\State`.
- **Commutative diagrams** are rendered with `tikz-cd`. If a diagonal arrow
  targets an empty cell, give that cell a placeholder `{}` so it has a named
  shape, or use a longer direction (e.g. `[ddrr]` instead of `[ddr]` when the
  intermediate row is empty).

## Provenance

Transcribed from `wyklad1.pdf` … `wyklad12.pdf`, `Wykład14.PDF.pdf`
(scans of handwritten board notes from Politechnika Warszawska).
The Kleisli-categories chapter was written from scratch — the original
source for that lecture is a single fragmentary page; the chapter develops the
construction in full, with proofs and four worked examples
(`Maybe` → partial functions, `M × (−)` → Trace, `P` → Rel, `State_A`).

Illegible handwritten passages were reconstructed using standard
category-theoretic interpretation. Review the math before relying on it for
teaching.
