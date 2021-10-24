#' Histogram (using ggplot2) with curve
#'
#' \code{histCurve} give histogram with density curve
#'
#' @param dat data frame
#' @param column variable name to be plotted
#' @param bin number of bins (default is 24)
#'
#' @return
#' @export
#'
#' @import ggplot2
#'
#' @examples
#' histCurve(iris, Sepal.Length)
histCurve <- function(dat, column, bin = 24){
  library(ggplot2)
  # define column so, no need to quotes/""
  col <- deparse(substitute(column))
  # mean
  avg <-
    mean(dat[[col]], na.rm = T)
  # sd
  std <-
    sd(dat[[col]], na.rm = T)

  # plot
  ggplot(dat, aes({{column}})) +
    geom_histogram(aes(y = stat(density)),
                   bins = 24,
                   alpha = 0.8,
                   colour = "white",
                   fill = "cornflowerblue",
                   size = 0.1) +
    stat_function(fun = dnorm,
                  args = list(mean = avg, sd = std),
                  lwd = 1.5,
                  col = "darkred") +
    theme_minimal()

}
