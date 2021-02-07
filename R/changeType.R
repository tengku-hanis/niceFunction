#' Change variable type
#' \code{changeType} change variable type across list of data frame
#'
#' @param x list of data frames
#' @param Var variables or column names
#' @param funct function to change variable type such as.factor(), as.Date(), as.factor(), etc
#'
#' @return list of data frames with changed variable type
#' @export
#'
#' @examples
#' # make a list
#' iris_list <- list(iris1 = iris, iris2 = iris)
#'
#' # change one variable type
#' iris_list <- lapply(iris_list, changeType, Var = "Sepal.Width", funct = "as.character")
#'
#' # change 2 variables type
#' iris_list <- lapply(iris_list, changeType, Var = c("Sepal.Length", "Species"), funct = "as.character")
changeType <- function(x, Var,funct = "as.Date"){
  x[, Var] <- lapply(x[, Var], funct); x
}
