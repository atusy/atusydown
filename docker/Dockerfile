FROM rocker/verse:latest

ARG zone="Asia/Tokyo"
ARG pandoc="2.7.2"

RUN ln -sf /usr/share/zoneinfo/${zone} /etc/localtime \
  # apt
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    # IPA fonts
    fonts-ipaexfont-gothic fonts-ipaexfont-mincho \
    # for webshot
    phantomjs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  # Noto fonts
  && wget -q \
    https://noto-website-2.storage.googleapis.com/pkgs/NotoSans-hinted.zip \
    https://noto-website-2.storage.googleapis.com/pkgs/NotoSerif-hinted.zip \
    https://noto-website-2.storage.googleapis.com/pkgs/NotoMono-hinted.zip \
    https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip \
    https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifCJKjp-hinted.zip \
  && mkdir -p /usr/share/fonts/truetype /usr/share/fonts/opentype \
  && unzip -n NotoSans-hinted.zip       -d /usr/share/fonts/truetype/noto \
  && unzip -n NotoSerif-hinted.zip      -d /usr/share/fonts/truetype/noto \
  && unzip -n NotoMono-hinted.zip       -d /usr/share/fonts/truetype/noto \
  && unzip -n NotoSansCJKjp-hinted.zip  -d /usr/share/fonts/opentype/noto \
  && unzip -n NotoSerifCJKjp-hinted.zip -d /usr/share/fonts/opentype/noto \
  && rm \
    NotoSans-hinted.zip \
    NotoSerif-hinted.zip \
    NotoMono-hinted.zip \
    NotoSansCJKjp-hinted.zip \
    NotoSerifCJKjp-hinted.zip \
  && chmod 644 \
    /usr/share/fonts/opentype/noto/* \
    /usr/share/fonts/truetype/noto/* \
  # Pandoc
  && rm -rf \
      /usr/lib/rstudio-server/bin/pandoc \
      /usr/local/bin/pandoc \
      /usr/local/bin/pandoc-citeproc \
  && wget \
    https://github.com/jgm/pandoc/releases/download/${pandoc}/pandoc-${pandoc}-1-amd64.deb && \
    dpkg -i pandoc-${pandoc}-1-amd64.deb && \
    rm pandoc-${pandoc}-1-amd64.deb \
  # R packages: install and configure 
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
    # for Japanese in XeLaTeX
    realscripts metalogo xltxtra zxjatype xecjk zxjafont \
    # for Pandoc
    biblatex bidi csquotes footnotehyper makecmds microtype polyglossia setspace unicode-math xurl \
  && tlmgr path add \
  && chown -R root:staff /usr/local/lib/R/site-library \
  && chown -R root:staff /opt/TinyTeX \
  && chmod -R g+w /opt/TinyTeX \
  && chmod -R g+wx /opt/TinyTeX/bin
