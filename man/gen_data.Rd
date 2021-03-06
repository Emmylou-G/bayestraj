% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gen_data.R
\name{gen_data}
\alias{gen_data}
\title{gen_data}
\usage{
gen_data(N, T, pi, beta, sigma, poly = 1, scale = FALSE)
}
\arguments{
\item{N:}{Integer, number of units}

\item{T:}{Integer, number of time periods}

\item{pi:}{Vector, probability of being assigned to each group}

\item{beta:}{Matrix, coefficients for each group}

\item{sigma:}{Float, variance for outcomes}

\item{poly:}{Integer, degree of polynomial}

\item{scale:}{Boolean, TRUE to scale design matrix}
}
\value{
List: \cr
   X: Matrix, dataset for series 1 \cr
   Y: Vector, outcomes for series 1 \cr
}
\description{
Generate data for a dual trajectory model
}
