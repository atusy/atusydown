#' Knit engines
#'
#' Additional engines for Rmd chunks
#'
#' @inheritParams knitr::engine_output
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
    options$code,
    paste(out, collapse = "")
  )
}

#' @rdname knit-engines
#' @importFrom glue glue
#' @section glue engine:
#'   Generates text powered by `glue::glue()`.
eng_glue <- function(options) {
  options$results <- 'asis'
  options$echo <- isTRUE(options$opts.include)
  if (is.null(options$glue.args$.sep)) options$glue.args$.sep <- "\n"
  engine_output(
    options,
    options$code,
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
#' @section opts engine:
#'   Returns options of a current chunk.
eng_opts <- function(options) {
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
  options$echo <- isTRUE(options$opts.include)
  engine_output(
    options,
    options$code,
    capture.output(str(out[sort(names(out))]))
  )
}

#' A helper function to parse parameters of source chunk
#' @noRd
opts_src <- function(options) {
  options[
    names(eval(parse(
      text = paste("alist(", options$params.src, ")", collapse = "")
    )))
  ]
}

#' @rdname knit-engines
#' @section footnote engine: Returns footnote whose label is same as the chunk label
eng_fn <- function(options) {
  options$code <- c(
    paste0("\n[^", options$label, "]:"),
    paste0("    ", options$code)
  )
  eng_glue(options)
}

#' @rdname knit-engines
#' @section note engine:
#'   For note. Generally returns nothing.
#'   If output is revealjs, then note is put to aside.
eng_note <- function(options) {
  options$code <- if (is_output("revealjs")) {
    c('<aside class="notes">', options$code, '</aside>')
  } else {
    NULL
  }
  eng_glue(options)
}
