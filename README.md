Let's build a rich R Markdown enrionment.

This repository is provides `atusydown` as an R package and as a Docker container.

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

`docker-compose.yml` is available.
Clone the source and launch by

```bash
sudo docker-compose up -d
```

Dockerfile adds to [rocker/verse](//hub.docker.com/r/rocker/verse/) more output formats and features on Rmd with pandoc 2.7.2.

- Adds R packages for Rmd in addition to `bookdown`, `rticles`, and `rmdshower`
    - More outputs
        - `blogdown` with latest Hugo
        - `flexdashboard`
        - `pagedown`
        - `pkgdown`
        - `revealjs`
    - Enhance outputs
        - `extrafont` to use variety of system fonts in ggplot2
        - `kableExtra` to extend `knitr::kable`
        - `svglite` to output figures in `svg` format
        - `webshot` to include screen shots of web pages and html widgets in PDF documents.
- Adds fonts to support more languages
    - IPAex 
    - Noto
