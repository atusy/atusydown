# atusydown 0.1.1.9000

## New features

- Knit engines
    - `footnote` and `fn` engines generate footnotes whose labels are same as the chunk labels.
    - `note` engine generates nothing because it is for internal notes.
      Exceptionally, it generates speaker notes for reveal.js slides.
- `is_output` function to check the output format.

## Fix

- `eng_glue()` coerces results "asis".
- `eng_opts` internally modifies options after copying specified options.


# atusydown 0.1.1

## New features

- Knit engines
    - `glue` provides programable writing based on `glue::glue()`.
      Specify optional arguments to `glue::glue()` as a list to `glue.args` in a chunk option.
    - `opts` returns chunk options of current chunk as a structure of a list.
      To minimize output, specify `"diff"` or `"src"` to `opts.show` in a chunk option.
      To disable sorting output, specify `FALSE` to `opts.sort` in a chunk option.
- Knit hooks
    - `opts.include` returns source chunk with chunk options.
    - `time = TRUE` returns elapsed time of a souce chunk.
      Specify `time.round` for rounding, otherwise the time is `signif()`ed.

## Suggested packages

### Added

- `printr`
- `gt`

### Moved to imported packages

- `knitr`
- `rmarkdown`

# atusydown 0.1.0

Born to provide an R package to suggest packages to extend R Markdown,
and a Docker image which is ready to use the suggested package by extending on rocker/tidyverse.

## Suggested packages

- `bookdown`
- `blogdown`
- `extrafont`
- `flexdashboard`
- `kableExtra`
- `knitr`
- `officedown`
- `pagedown`
- `pkgdown`
- `rmarkdown`
- `revealjs`
- `svglite`
- `tinytex`
- `webshot`
