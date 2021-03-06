#' Read all excel sheets
#'
#' \code{read_excel_allsheets} read all excel sheets. Function was adapted from https://stackoverflow.com/a/12945838/11215767
#'
#' @param filename excel files
#' @param pages number of order of sheets in the excel (to select certain sheets)
#' @param tibble set to TRUE for tibble format (default is FALSE)
#'
#' @return
#' @export
#'
#' @examples
#' ## Read all excel sheets
#' \dontrun{read_excel_allsheets("datasets")
#' }
#'
#' ## Read several excel sheets
#' \dontrun{read_excel_allsheets("datasets", pages = 2:5)
#' }
read_excel_allsheets <- function(filename, pages = sheets, tibble = FALSE) {
  # I prefer straight data.frames
  # but if you like tidyverse tibbles (the default with read_excel)
  # then just pass tibble = TRUE
  sheets <- readxl::excel_sheets(filename)
  sheets <- sheets[pages]
  x <- lapply(sheets, function(X) readxl::read_excel(filename, sheet = X))
  if(!tibble) x <- lapply(x, as.data.frame)
  names(x) <- sheets
  x
}
