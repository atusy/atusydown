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
