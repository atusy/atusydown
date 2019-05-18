#' @importFrom knitr knit_engines
.onLoad <- function(libname, pkgname) {
  knit_engines$set(
    glue = eng_glue,
    opts = eng_opts,
    text = eng_text
  )
}
