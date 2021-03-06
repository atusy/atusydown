# Extend R Markdown by additional functions and a collection of suggested packages

This repository provides `atusydown` as an [R package](#r-package-atusyatusydown) and as a [Docker](#docker-atusyatusydown) container.

Try by editing a following `docker-compose.yml` and run `docker-compose up -d`

```
version: "3"
services:
  r:
    image: atusy/atusydown:dev
    ports:
      - "8787:8787"
    environment:
      - USER=rstudio
      - PASSWORD=password
```

## R Package `atusy/atusydown`

The `atusydown` as an R package provides additional functions and 
**suggests** following packages to extend R Markdown.

- `bookdown`
- `blogdown`
- `cssgrid`
- `extrafont`
- `gt`
- `flexdashboard`
- `kableExtra`
- `officedown`
- `pagedown`
- `printr`
- `pkgdown`
- `revealjs`
- `shiny`
- `svglite`
- `tinytex`
- `webshot`

Install by copy and paste a following command.

```r
source("https://raw.githubusercontent.com/r-lib/remotes/master/install-github.R")$value("atusy/atusydown", dependencies = TRUE)
```

## Docker `atusy/atusydown`

Dockerfile adds to [rocker/verse](//hub.docker.com/r/rocker/verse/) more output formats and features on Rmd with pandoc 2.7.2.

- Adds R packages for Rmd in addition to `bookdown`, `rticles`, and `rmdshower` to extend
    - Outputs formats from
        - `blogdown` with latest Hugo
        - `flexdashboard`
        - `officedown`
        - `pagedown`
        - `pkgdown`
        - `revealjs`
    - Contents
        - `extrafont` to use variety of system fonts in ggplot2
        - `kableExtra` to extend `knitr::kable`
        - `svglite` to output figures in `svg` format
        - `webshot` to include screen shots of web pages and html widgets in PDF documents.
- Adds fonts to support more languages
    - IPAex Gothic/Mincho
    - Noto Sans/Serif
    - Noto Sans/Serif CJK JP
- Adds tlmgr packages suggested by
    - kableExtra 
        - https://haozhu233.github.io/kableExtra/awesome_table_in_pdf.pdf
    - Japanese output in XeLaTeX
        - xltxtra zxjatype xecjk zxjafont (+ realscripts metalogo)
    - Pandoc
        - https://www.pandoc.org/MANUAL.html#creating-a-pdf
        - Note: biber is not available via tlmgr (2019-04-30)
