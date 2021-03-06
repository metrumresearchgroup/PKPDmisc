% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AUC_inf.R
\name{auc_inf}
\alias{auc_inf}
\title{Calculate AUCt-inf}
\usage{
auc_inf(idv, dv, last_points = c(3, 4, 5), na.rm = TRUE)
}
\arguments{
\item{idv}{column name for independent variable such as time}

\item{dv}{column name for dependent variable such as concentration}

\item{last_points}{vector of amount of points in terminal phase that will be evaluated for extrapolation}

\item{na.rm}{remove any NAs from the idv/dv column before calculating AUC}
}
\description{
Calculate AUCt-inf
}
\details{
last_points defaults to 3, 4, 5
see auc_partial for other details
}
