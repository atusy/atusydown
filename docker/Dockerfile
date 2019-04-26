FROM rocker/verse:latest

ARG zone="Asia/Tokyo"
ARG pandoc="2.7.2"

RUN ln -sf /usr/share/zoneinfo/${zone} /etc/localtime \
  # apt
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    # fonts
    fonts-ipaexfont-gothic fonts-ipaexfont-mincho \
    fonts-noto-cjk fonts-noto-hinted fonts-noto-mono fonts-noto-unhinted \
    # for webshot
    phantomjs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  # Install pandoc
  && rm -rf \
      /usr/lib/rstudio-server/bin/pandoc \
      /usr/local/bin/pandoc \
      /usr/local/bin/pandoc-citeproc \
  && wget \
    https://github.com/jgm/pandoc/releases/download/${pandoc}/pandoc-${pandoc}-1-amd64.deb && \
    dpkg -i pandoc-${pandoc}-1-amd64.deb && \
    rm pandoc-${pandoc}-1-amd64.deb \
  # Install and configure R packages
  && r -e "options(Ncpus = max(1L, parallel::detectCores())); remotes::install_github('atusy/atusydown', upgrade = 'always', dependencies = TRUE)" \
  # Setup webshot
  && echo "QT_QPA_PLATFORM=offscreen" >> /usr/local/lib/R/etc/Renviron \
  # Setup extrafont
  && r -e "extrafont::font_import(prompt = FALSE)" \
  # Setup blogdown (hugo) \
  && r -e "options(blogdown.hugo.dir = '/usr/local/bin'); blogdown::install_hugo()" \
  # Setup tlmgr
  && tlmgr install \
    # for kableExtra
    multirow wrapfig float colortbl tabu threeparttable threeparttablex ulem makecell xcolor \
    # for kableExtra (additional)
    varwidth environ trimspaces \
    # for Japanese in XeTeX
    realscripts metalogo xltxtra zxjatype xecjk zxjafont \
  && chown -R root:staff /usr/local/lib/R/site-library \
  && chown -R root:staff /opt/TinyTeX \
  && chmod -R g+w /opt/TinyTeX \
  && chmod -R g+wx /opt/TinyTeX/bin

CMD ["/init"]
