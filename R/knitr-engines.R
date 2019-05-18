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
  options$echo <- isTRUE(options$opts.include)
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
  options$echo <- isTRUE(options$opts.include)
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
eng_opts <- function(options) {
  options$echo <- isTRUE(options$opts.include)
  out <- options
  if (isTRUE(options$opts.show == "diff")) {
    default <- opts_chunk$get()[names(options)]
    out <- out[!unlist(Map(identical, options, default), use.names = FALSE)]
  }
  if (isTRUE(options$opts.show == "src")) {
    out <- opts_src(options)
  }
  if (isTRUE(options$opts.sort) | is.null(options$opts.sort)) {
    out[sort(names(out))]
  }
  engine_output(
    options,
    NULL,
    capture.output(str(out[sort(names(out))]))
  )
}

#' Returns chunk options of a source chunk
#' @param options Chunk options
opts_src <- function(options) {
  opts <- options[
    names(eval(parse(
      text = paste("alist(", options$params.src, ")", collapse = "")
    )))
  ]
}
