A rich environment fo R Markdown.

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

# R Package `atusy/atusydown`

A meta package which **suggests** to install following packages.

- `bookdown`
- `blogdown`
- `extrafont`
- `flexdashboard`
- `kableExtra`
- `knitr`
- `pagedown`
- `pkgdown`
- `revealjs`
- `rmarkdown`
- `svglite`
- `tinytex`
- `webshot`

Install by copy and paste a following command.

```r
source("https://raw.githubusercontent.com/r-lib/remotes/master/install-github.R")$value("atusy/atusydown", dependencies = TRUE)
```

# Docker `atusy/atusydown`

Dockerfile adds to [rocker/verse](//hub.docker.com/r/rocker/verse/) more output formats and features on Rmd with pandoc 2.7.2.

- Adds R packages for Rmd in addition to `bookdown`, `rticles`, and `rmdshower` to extend
    - Outputs formats
        - `blogdown` with latest Hugo
        - `flexdashboard`
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
        - https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=2ahUKEwjtkoewrPfhAhWnUN4KHcRFD-YQFjAAegQIBhAC&url=https%3A%2F%2Fhaozhu233.github.io%2FkableExtra%2Fawesome_table_in_pdf.pdf&usg=AOvVaw1KUfrGaz2bDPo-9bmnbFlw
    - Japanese output in XeLaTeX
        - xltxtra zxjatype xecjk zxjafont (+ realscripts metalogo)
    - Pandoc
        - https://www.pandoc.org/MANUAL.html#creating-a-pdf
        - Note: biber is not available via tlmgr (2019-04-30)
