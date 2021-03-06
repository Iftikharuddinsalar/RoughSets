% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/FeatureSelection.R
\name{FS.greedy.heuristic.superreduct.RST}
\alias{FS.greedy.heuristic.superreduct.RST}
\title{The greedy heuristic method for determining superreduct based on RST}
\usage{
FS.greedy.heuristic.superreduct.RST(decision.table,
  attrDescriptions = attr(decision.table, "desc.attrs"),
  decisionIdx = attr(decision.table, "decision.attr"), qualityF = X.gini,
  nAttrs = NULL, inconsistentDecisionTable = NULL)
}
\arguments{
\item{decision.table}{an object of a \code{"DecisionTable"} class representing a decision table.
See \code{\link{SF.asDecisionTable}}.}

\item{attrDescriptions}{a list containing possible values of attributes (columns)
in \code{decision.table}. It usually corresponds to \code{attr(decision.table, "desc.attrs")}.}

\item{decisionIdx}{a integer value representing an index of decision attribute.}

\item{qualityF}{a function for calculating a quality of an attribute subset.
See \code{\link{FS.greedy.heuristic.reduct.RST}}.}

\item{nAttrs}{an integer between 1 and the number of conditional attributes. It indicates
the attribute sample size for the Monte Carlo selection of candidating attributes.
If set to \code{NULL} (default) all attributes are used and the algorithm changes
to a standard greedy method for computation of decision reducts.}

\item{inconsistentDecisionTable}{logical indicating whether the decision table is suspected
       to be inconsistent or \code{NULL} (the default) which indicated that a test should
       be made to determine the data consistency.}
}
\value{
A class \code{"FeatureSubset"} that contains the following components:
\itemize{
\item \code{reduct}: a list representing a single reduct. In this case, it could be a superreduct or just a subset of features.
\item \code{type.method}: a string representing the type of method which is \code{"greedy.heuristic.superreduct"}.
\item \code{type.task}: a string showing the type of task which is \code{"feature selection"}.
\item \code{model}: a string representing the type of model. In this case, it is \code{"RST"} which means rough set theory.
}
}
\description{
It is used to get a feature subset (superreduct) based on the greedy heuristic algorithm
employing some quality measurements. Regarding the quality measurements, the detailed description can be seen in \code{\link{FS.greedy.heuristic.reduct.RST}}.
}
\examples{
###################################################
## Example 1: Evaluate reduct and generate
##            new decision table
###################################################
data(RoughSetData)
decision.table <- RoughSetData$hiring.dt

## evaluate single reduct
res.1 <- FS.greedy.heuristic.superreduct.RST(decision.table, qualityF = X.nOfConflicts)
print(res.1)

## generate new decision table according to the reduct
new.decTable <- SF.applyDecTable(decision.table, res.1)
}
\author{
Andrzej Janusz
}
\references{
A. Janusz and S. Stawicki, "Applications of Approximate Reducts to the Feature Selection Problem",
Proceedings of International Conference on Rough Sets and Knowledge Technology ({RSKT}), vol. 6954, p. 45 - 50 (2011).

D. Ślęzak, "Approximate Entropy Reducts", Fundamenta Informaticae, vol. 53, no. 3 - 4, p. 365 - 390 (2002).

J. Wroblewski, "Ensembles of Classifiers Based on Approximate Reducts", Fundamenta Informaticae, vol. 47, no. 3 - 4, p. 351 - 360 (2001).
}
\seealso{
\code{\link{FS.quickreduct.RST}} and \code{\link{FS.feature.subset.computation}}.
}

