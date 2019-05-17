#' Knit engines
#'
#' Additional engines for Rmd chunks
#'
#' @section
#'
#' @name knit-engines
#'
#' @importFrom knitr
#'   engine_output
#'   knit_engines
NULL

#' @rdname knit-engines
eng_text <- function(options) {
  options$results <- 'asis'
  options$echo <- FALSE
  out <- options$code
  out[out == ""] <- "\n\n"
  engine_output(
    options,
    NULL,
    paste(out, collapse = "")
  )
}

#' @rdname knit-engines
#' @importFrom glue glue
eng_glue <- function(options) {
  options$results <- 'asis'
  options$echo <- FALSE
  if (is.null(options$glue.args$.sep)) options$glue.args$.sep <- "\n"
  engine_output(
    options,
    NULL,
    do.call(
      glue,
      c(
        as.list(options$code),
        options$glue.args
      )
    )
  )
}

#' @rdname knit-engines
#' @importFrom knitr opts_chunk
eng_options <- function(options) {
  options$echo <- FALSE
  out <- options
  if (isTRUE(options$options.diff)) {
    default <- opts_chunk$get()[names(options)]
    out <- out[!unlist(Map(identical, options, default), use.names = FALSE)]
    out$options.diff <- NULL
  }
  engine_output(
    options,
    NULL,
    capture.output(str(out))
  )
}
