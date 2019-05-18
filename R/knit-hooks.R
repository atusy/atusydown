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

#' @importFrom stringr str_replace_all
#' @importFrom knitr knit_hooks
hook_src <- function(default = knit_hooks$get("source")) {
  force(default)
  function(x, options) {
    if (!isTRUE(options$opts.include)) {
      return(default(x, options))
    }
    print(options$params.src)
    opts <- str_replace_all(
      options$params.src,
      c(
        ",? *opts\\.include *= *TRUE" = "",
        "^ +" = ", "
      )
    )
    paste0(
      "\n\n````{.text}\n```{",
      paste0(
        tolower(options$engine),
        " "[!grepl("^,", opts)],
        opts
      ),
      "}\n",
      paste(x, collapse = "\n"),
      "\n```\n````\n\n"
    )
  }
}
