% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/drawintercept.R
\name{drawintercept}
\alias{drawintercept}
\title{drawintercept}
\usage{
drawintercept(X, y, beta, sigmasq, n)
}
\arguments{
\item{X:}{Matrix, design matrix. Does not include intercept column}

\item{y:}{Vector, outcomes}

\item{beta:}{Vector, regression coefficients}

\item{sigmasq:}{Float, regression variance}

\item{n:}{Integer, sample size}
}
\description{
Estimate the trajectory model with model averaging
}
