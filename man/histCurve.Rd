% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/histCurve.R
\name{histCurve}
\alias{histCurve}
\title{Histogram (using ggplot2) with curve}
\usage{
histCurve(dat, column, bin = 24)
}
\arguments{
\item{dat}{data frame}

\item{column}{variable name to be plotted}

\item{bin}{number of bins (default is 24)}
}
\value{
a ggplot2 histogram with a normal density curve
}
\description{
\code{histCurve} give histogram with density curve
}
\examples{
histCurve(iris, Sepal.Length)
}
