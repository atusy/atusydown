#' Is output format one of x?
#' @param x Expected formats in a character vector.
#' @importFrom knitr opts_knit
#' @export
is_output <- function(x) {
  any(opts_knit$get("rmarkdown.pandoc.to") %in% x)
}

