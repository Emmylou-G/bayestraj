#' drawpi
#'
#' Draw pi from posterior distribution
#'
#' @param g: Vector, group memberships
#' @param alpha: Vector, parameters of Dirichlet prior
#' @param K: Integer, number of groups
#'
#' @importFrom MCMCpack rdirichlet
#'
#' @export


#--------------maybe better to correspond with the formula in the paper, e.g. the following is from (21d) in the paper
drawpi = function(g, alpha, K) {
  pi = as.vector(rdirichlet(1, alpha + table(factor(g, levels = 1:K))))
  return(pi)
}
