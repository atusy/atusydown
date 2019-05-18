#' Knitting docx?
#' @export
is_docx_output <- function() {
  pandocto <- knitr:::pandoc_to()
  !is.null(pandocto) && pandocto == 'docx'
}

#' Is x available and newer than y?
#' @param x,y filess to comapre
#' @export
is_newer <- function(x, y) {
  file.exists(x) && (file.mtime(x) > file.mtime(y))
}

#' Extends knitr::include_graphics by automatic file conversions
#'
#' @param auto_pdf
#'   Convert svg to pdf when knitting pdf (default: `TRUE`).
#' @param auto_png
#'   Convert svg to png when knitting docx (default: `TRUE`)
#' @inherit
#'   knitr::include_graphics
#'
#' @importFrom knitr fig_path
#' @importFrom rsvg rsvg_pdf rsvg_png
#' @export
include_graphics2 <- function(
  path, auto_pdf = TRUE, auto_png = TRUE, dpi = NULL
) {
  is_svg <- grepl('\\.svg$', path)
  if (is_svg && auto_png && is_docx_output()) {
    out <- fig_path(".png")
    if (!is_newer(out, path)) rsvg_png(path, out)
    path <- out
  }
  if (is_svg && auto_pdf && knitr:::is_latex_output()) {
    out <- fig_path(".pdf")
    if (!is_newer(out, path)) rsvg_pdf(path, out)
    path <- out
  }
  structure(path, class = c("knit_image_paths", "knit_asis"), dpi = dpi)
}
