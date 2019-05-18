#' @importFrom knitr knit_engines knit_hooks
.onLoad <- function(libname, pkgname) {
  knit_engines$set(
    fn = eng_fn,
    footenote = eng_fn,
    glue = eng_glue,
    opts = eng_opts,
    text = eng_text
  )
  knit_hooks$set(
    time = hook_time,
    source = hook_src(knit_hooks$get("source"))
  )
}
