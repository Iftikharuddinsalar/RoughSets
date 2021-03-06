% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/MissingValue.R
\name{MV.mostCommonVal}
\alias{MV.mostCommonVal}
\title{Replacing missing attribute values by the attribute mean or common values}
\usage{
MV.mostCommonVal(decision.table)
}
\arguments{
\item{decision.table}{a \code{"DecisionTable"} class representing a decision table. See \code{\link{SF.asDecisionTable}}.
Note: missing values are recognized as NA.}
}
\value{
A class \code{"MissingValue"}. See \code{\link{MV.missingValueCompletion}}.
}
\description{
It is used for handling missing values by replacing the attribute mean or common values. If an attributes containing missing values is continuous/real, the method uses mean of the attribute instead of the most common value.
In order to generate a new decision table, we need to execute \code{\link{SF.applyDecTable}}.
}
\examples{
#############################################
## Example: Replacing missing attribute values
##          by the attribute mean/common values
#############################################
dt.ex1 <- data.frame(
     c(100.2, 102.6, NA, 99.6, 99.8, 96.4, 96.6, NA),
     c(NA, "yes", "no", "yes", NA, "yes", "no", "yes"),
     c("no", "yes", "no", "yes", "yes", "no", "yes", NA),
     c("yes", "yes", "no", "yes", "no", "no", "no", "yes"))
colnames(dt.ex1) <- c("Temp", "Headache", "Nausea", "Flu")
decision.table <- SF.asDecisionTable(dataset = dt.ex1, decision.attr = 4,
                                    indx.nominal = c(2:4))
indx = MV.mostCommonVal(decision.table)
}
\author{
Lala Septem Riza
}
\references{
J. Grzymala-Busse and W. Grzymala-Busse, "Handling Missing Attribute Values," in Data Mining and Knowledge Discovery Handbook,
O. Maimon and L. Rokach, Eds. New York : Springer, 2010, pp. 33-51
}
\seealso{
\code{\link{MV.missingValueCompletion}}
}

