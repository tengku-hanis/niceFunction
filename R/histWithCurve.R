#' Histogram with curve
#'
#' \code{histWithCurve} returns histogram with a normal density curve
#'
#' @param x the vector or column name of a dataset
#' @param breaks number of bins
#'
#' @return
#' @export
#'
#' @import graphics
#' @importFrom stats dnorm
#'
#' @examples
#' histWithCurve(iris$Sepal.Length)
histWithCurve <- function(x, breaks = 24) {

  h <- hist(x, breaks = breaks, col = "lightblue")
  xfit <- seq(min(x), max(x), length = 40)
  yfit <- dnorm(xfit, mean = mean(x), sd = sd(x))
  yfit <- yfit * diff(h$mids[1:2]) * length(x)
  lines(xfit, yfit, lwd = 2)

}

