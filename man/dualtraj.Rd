% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dualtraj.R
\name{dualtraj}
\alias{dualtraj}
\title{dualtraj}
\usage{
dualtraj(X1, X2, y1, y2, K1, K2, z1, z2, iterations, thin = 1,
  dispIter = 10, ll = FALSE)
}
\arguments{
\item{X1:}{Matrix, design matrix for series 1. 1st column should be the id.}

\item{X2:}{Matrix, design matrix for series 2. 1st column should be the id.}

\item{y1:}{Vector, outcomes for series 1}

\item{y2:}{Vector, outcomes for series 2}

\item{K1:}{Integer, number of latent classes in series 1}

\item{K2:}{Integer, number of latent classes in series 2}

\item{z1:}{Matrix, K1 x dim(X1)[2] indicator matrix indicating which variables to include in each group.}

\item{z2:}{Matrix, K2 x dim(X2)[2] indicator matrix indicating which variables to include in each group.}

\item{iterations:}{Integer, number of MCMC iterations}

\item{thin:}{Integer, store every 'thin' iteration}

\item{dispIter:}{Integer, frequency of printing the iteration number}

\item{ll:}{Boolean, Set to TRUE to display the maximum log-likelihood over all the draws.}
}
\description{
Estimate the dual trajectory model using a Gibbs Sampler
}
