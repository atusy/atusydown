#' @importFrom knitr knit_engines
.onLoad <- function(libname, pkgname) {
  knit_engines$set(
    glue = eng_glue,
    options = eng_options,
    text = eng_text
  )
}
