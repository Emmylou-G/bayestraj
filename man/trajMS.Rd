% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/trajMS.R
\name{trajMS}
\alias{trajMS}
\title{trajMS}
\usage{
trajMS(X, y, K, time_index, iterations, thin = 1, dispIter = 10)
}
\arguments{
\item{X:}{Matrix, design matrix for. 1st column should be the id. Last columns of X correspond to time and polynomials of time.}

\item{y:}{Vector, outcomes}

\item{K:}{Integer, number of latent classes}

\item{time_index:}{Integer, column of X corresponding to time}

\item{iterations:}{Integer, number of MCMC iterations}

\item{thin:}{Integer, store every 'thin' iteration}

\item{dispIter:}{Integer, frequency of printing the iteration number}
}
\description{
Estimate the trajectory model with model averaging
}
