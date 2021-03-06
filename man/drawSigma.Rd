% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/drawsigma.R
\name{drawsigma}
\alias{drawsigma}
\title{drawsigma}
\usage{
drawsigma(X, Y, beta, index, nu, sigma0, N)
}
\arguments{
\item{X:}{Matrix, design matrix}

\item{Y:}{Vector, outcomes}

\item{beta:}{Matrix, coefficients for Y in each row}

\item{index:}{Vector, group membership for each row of X and Y}

\item{nu:}{Float, prior parameter}

\item{sigma0:}{Float, prior parameter}

\item{N:}{Integer, sample size}
}
\description{
Draw sigma from posterior distribution
}
