#' Knit hooks
#' @name knit-hooks
#' @param before,options,envir Required parameters for chunk hooks.
NULL

#' @rdname knit-hooks
#' @section time:
#'   Specify `TRUE` to measure elapsed time by evaluating a chunk.
hook_time <- function(before, options, envir) {
  t <- proc.time()['elapsed']
  if (before) {
    envir$.elapsed <- t
  } else {
    t <- t - envir$.elapsed
    t <- if (!is.null(options$time.digits)) {
      round(t, options$time.digits)
    } else {
      signif(t)
    }
    paste(t, 'sec.')
  }
}

#' @rdname knit-hooks
#' @section opts.include:
#'   Specify `TRUE` to output source chunks together with their chunk options.
#' @param default
#'   A default function to render source chunk.
#'
#' @importFrom stringr str_replace_all
#' @importFrom knitr knit_hooks
hook_src <- function(default = knit_hooks$get("source")) {
  force(default)
  function(x, options) {
    if (!isTRUE(options$opts.include)) return(default(x, options))
    opts <- str_replace_all(
      options$params.src,
      c(",? *opts\\.include *= *TRUE" = "", "^ +" = ", ")
    )
    paste0(
      "\n\n````{.text}\n```{",
      paste0(tolower(options$engine)," "[!grepl("^,", opts)], opts), "}\n",
      paste(x, collapse = "\n"),
      "\n```\n````\n\n"
    )
  }
}
