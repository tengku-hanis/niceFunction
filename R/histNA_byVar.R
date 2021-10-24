#' Histogram for NAs
#'
#' \code{histNA_byVar} check the distribution of NAs of certain variable is affected by another variable
#'
#' @param dat data frame
#' @param NAvar variable with NAs
#' @param byvar influencing variable
#' @param bin number of bins (default is 30)
#'
#' @return two histogram of influencing variable which separated by the presence of NAs in the NAvar
#' @export
#'
#' @import ggplot2
#' @import dplyr
#' @importFrom rlang .data
#'
#' @examples
#' dat <- iris
#' dat[dat$Species == "setosa", "Sepal.Length"] <- NA
#' #indicate right-tailed missingness
#' histNA_byVar(dat, Sepal.Length, Sepal.Width)
histNA_byVar <- function(dat, NAvar, byvar, bin = 30){

  if (requireNamespace(c("ggplot2", "dplyr"), quietly = TRUE)) {
    dat %>%
      mutate(varNA = is.na({{NAvar}})) %>%
      ggplot(aes({{byvar}})) +
      geom_histogram(bins = {{bin}}) +
      facet_grid(vars(.data$varNA)) +
      theme_minimal()
  } else {
    ## please install ggplot2 and dplyr packages
  }

}
