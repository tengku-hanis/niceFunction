#' Regression diagnostic
#'
#' \code{regDiag} is for screening of outliers and influential cases.
#'
#' @param model  lm or glm model
#'
#' @return Outlier : leverage, Studentized deleted residual (SDR)
#' @return Influential case : DFFits, DFBetas, cook's distance (cook.d)
#' @return also noted that we use dfbetas (scaled/standardized) NOT dfbeta function
#' @return TRUE : outlier and influential case present,
#' @return FALSE : no outlier and influential case
#'
#' @return Cut-off values:
#' @return leverage > 0.2
#' @return SDR >= 3 or <= -3
#' @return DFFits > 1
#' @return DFBetas > 1
#' @return cook.d > 0.5
#' @export
#'
#' @examples
#' mod <- lm(Sepal.Length ~ Species + Sepal.Width, data = iris)
#' regDiag(mod)
regDiag = function(model){
  lev = hatvalues(model)
  s.dr = rstudent(model)
  dfit = dffits(model)
  dbeta = dfbetas(model)
  coo = cooks.distance(model)

  leverage = lev >0.2
  SDR = s.dr >=3 | s.dr <=-3
  DFFits = dfit >1
  DFBetas = dbeta >1
  cook.d = coo >0.5

  outlier = list(leverage = table(leverage), SDR = table(SDR))
  influence = list(DFFits = table(DFFits), DFBetas = table(DFBetas), cook.d = table(cook.d))
  result = list(outlier = outlier, influence = influence)
  return(result)
}
