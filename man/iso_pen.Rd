\name{iso_pen}
\alias{iso_pen}
\title{
Penalized Isotonic Regression in one and two dimensions
}
\description{
Given a response vector y and a predictor matrix xmat with (one or two) columns, the isotonic regression estimator is returned, with the usual (complete or partial) ordering.   
}
\usage{
iso_pen(y, xmat, wt = 1, pen = TRUE, default = TRUE, lambda = 0, nsim = 0, alpha = 0.05)
}
\arguments{
  \item{y}{
The response vector of length n
}
  \item{xmat}{
Either a one-dimensional predictor vector or an n by 2 matrix of two-dimensional predictor values.
}
  \item{wt}{
Optional weights -- a positive vector of length n.
}
  \item{pen}{
If pen=FALSE, no penalty is applied to tame spiking.   Default is pen=TRUE.
}
  \item{default}{
If default=FALSE, the user must specify a penalty value.   
}
  \item{lambda}{
Optional penalty.   If pen=0, an unpenalized isotonic regression is performed.   If not supplied a default penalty is used.
}
  \item{nsim}{
The number of simulations used in the computation of approximate point-wise confidence intervals.   The default is nsim=0, and no confidence intervals are returned.
}
  \item{alpha}{
The confidence level of the confidence intervals.  Default is alpha=.05 (i.e., 95 percent confidence intervals)
}
}
\details{
The least-squares isotonic regression is computed using the coneA function of the R package coneproj.   
}
\value{
\item{fit}{The fitted values; i.e., the estimated expected response}
\item{sighat}{The estimated model standard deviation}
\item{upper}{The upper points of the point-wise confidence intervals, returned if nsim>0}
\item{lower}{The lower points of the point-wise confidence intervals, returned if nsim>0}
}
\references{
Meyer, M.C. (2013) A Simple New Algorithm for Quadratic Programming with Applications in Statistics, \emph{Communications in Statistics}, \bold{42(5)}, 1126-1139.
}
\author{
Mary C Meyer, Professor, Department of Statistics, Colorado State University
}
\examples{
### plot the estimated expected lung volume of children given age and height
data(FEV)
x1=FEV[,1]   ## age
x2=FEV[,3]   ## height
y=FEV[,2]
ans=iso_pen(y,cbind(x1,x2))
persp(ans$xg1,ans$xg2,ans$xgmat,th=-40,tick="detailed",xlab="age",ylab="height",zlab="FEV")
}
\keyword{isotonic}
\keyword{monotone}
