#' gen_data
#'
#' Generate data for a dual trajectory model
#' @param N: Integer, number of units
#' @param T: Integer, number of time periods
#' @param pi: Vector, probability of being assigned to each group
#' @param beta: Matrix, coefficients for each group
#' @param sigma: Float, variance for outcomes
#' @param poly: Integer, degree of polynomial
#' @param scale: Boolean, TRUE to scale design matrix
#'
#'
#' @return List: \cr
#'    X: Matrix, dataset for series 1 \cr
#'    Y: Vector, outcomes for series 1 \cr
#' @export

gen_data = function(N,T,pi,beta,sigma,poly=1,scale=FALSE) {
  if(length(pi) != dim(beta)[1])
    stop("Incompatible dimensions for pi1 and beta1")
  
  #generate IDs
  id = rep(1:N,each=T)
  
  #dimension of design matrix
  d = dim(beta)[2]
  
  #number of random uniform covariates.
  ncov = d - poly - 1
  
  #time dimension
  time = rep(1:T,N)
  
  #generate design matrices
  X = cbind(rep(1,N*T),
             matrix(runif(N*T*ncov)*10,N*T,ncov))
  if (poly > 0){
    for (i in 1:poly){
      X = cbind(X,time^i)
    }
  }
  
  if (scale == TRUE) {
    X[,-1] = scale(X[,-1])
  }
  
  #generate group memberships
  K = dim(beta)[1]
  g = sample(c(1:K),N,replace=TRUE,prob=pi)
  
  #genereate outcomes
  index = g[id]
  
  Y = rowSums(X*beta[index,]) + rnorm(N*T,sd=sqrt(sigma))
  
  #replace 1st column with id
  X[,1]=id
  
  return(list(X=X,Y=Y,g=g))
}

#' gen_data_dual
#'
#' Generate data for a dual trajectory model
#' @param N: Integer, number of tandems
#' @param T1: Integer, number of time periods in series 1
#' @param T2: Integer, number of time periods in series 2
#' @param pi1: Vector, probability of being assigned to each group in series 1
#' @param pi2: Matrix, transition matrix. Row j is the transition probabilities for when the series 1 group is j
#' @param beta1: Matrix, coefficients for each group in series 1
#' @param beta2: Matrix, coefficients for each group in series 2
#' @param sigma1: Float, variance for outcomes in series 1
#' @param sigma2: Float, variance for outcomes in series 2
#' @param scale: Boolean, TRUE to scale design matrix
#'
#'
#' @return List: \cr
#'    X1: Matrix, dataset for series 1 \cr
#'    X2: Matrix, dataset for series 2 \cr
#'    Y1: Vector, outcomes for series 1 \cr
#'    Y2: Vector, outcomes for series 2 \cr
#' @export

gen_data_dual = function(N,T1,T2,pi1,pi2,beta1,beta2,sigma1,sigma2,poly=1,scale=FALSE) {
  if(length(pi1) != dim(pi2)[1])
    stop("Incompatible dimensions for pi1 and pi2")
  
  if(length(pi1) != dim(beta1)[1])
    stop("Incompatible dimensions for pi1 and beta1")
  
  if(dim(pi2)[2] != dim(beta2)[1])
    stop("Incompatible dimensions for pi2 and beta2")
  
  #generate IDs
  id1 = rep(1:N,each=T1)
  id2 = rep(1:N,each=T2)
  
  #dimension of design matrix
  d1 = dim(beta1)[2]
  d2 = dim(beta2)[2]
  
  #number of random uniform covariates.
  ncov1 = d1 - poly - 1 
  ncov2 = d2 - poly - 1
  
  #time dimension
  time1 = rep(1:T1,N)
  time2 = rep(1:T2,N)
  
  #generate design matrices
  X1 = cbind(rep(1,N*T1),
             matrix(runif(N*T1*ncov1)*10,N*T1,ncov1))
  if (poly > 0){
    for (i in 1:poly){
      X1 = cbind(X1,time1^i)
    }
  }
  
  X2 = cbind(rep(1,N*T2),
             matrix(runif(N*T2*ncov2)*10,N*T2,ncov2))
  if (poly > 0){
    for (i in 1:poly){
      X2 = cbind(X2,time2^i)
    }
  }
  
  if (scale == TRUE) {
    X1[,-1] = scale(X1[,-1])
    X2[,-1] = scale(X2[,-1])
  }
  
  #generate group memberships
  K1 = dim(beta1)[1]
  K2 = dim(beta2)[1]
  g1 = sample(c(1:K1),N,replace=TRUE,prob=pi1)
  g2 = numeric(N)
  for (i in 1:N) {
    g2[i] = sample(c(1:K2),1,replace=TRUE,prob=pi2[g1[i],])
  }
  
  #genereate outcomes
  index1 = g1[id1]
  index2 = g2[id2]
  
  Y1 = rowSums(X1*beta1[index1,]) + rnorm(N*T1,sd=sqrt(sigma1))
  Y2 = rowSums(X2*beta2[index2,]) + rnorm(N*T2,sd=sqrt(sigma2))
  
  #replace 1st column with id
  X1[,1]=id1
  X2[,1]=id2
  
  return(list(X1=X1,X2=X2,Y1=Y1,Y2=Y2,g1=g1,g2=g2))
}