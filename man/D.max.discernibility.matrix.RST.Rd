% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/Discretization.R
\name{D.max.discernibility.matrix.RST}
\alias{D.max.discernibility.matrix.RST}
\title{The maximal discernibility algorithm}
\usage{
D.max.discernibility.matrix.RST(decision.table)
}
\arguments{
\item{decision.table}{a \code{"DecisionTable"} class representing the decision table. See \code{\link{SF.asDecisionTable}}.
It should be noted that the function need the nominal decision attribute.}
}
\value{
A class \code{"Discretization"} that contains the following components:
\itemize{
\item \code{cut.values}: a list representing cut values of each considered attributes.
\item \code{type.method}: a type of method which is used to define cut values.

       In this case, it is \code{"max.discernibility"}.
\item \code{type.task}: a type of task which is \code{"discretization"}.
\item \code{model}: a type of model which is \code{"RST"}.
}
}
\description{
This is a function that implements the maximal discernibility algorithm based on rough set theory proposed
by (Bazan et al, 2000), for discretization tasks.
}
\details{
Let \eqn{A = (U, A \cup \{d\})}  be a decision table. An arbitrary attribute \eqn{a \in A} defines a sequence \eqn{v_{1}^a < v_{2}^a < \ldots < v_{n_{a}}^a}, where
\eqn{\{v_{1}^a, v_{2}^a, \ldots, v_{n_{a}}^a \} = \{a(x): x : \in U \}} and \eqn{n_{a} \leq n}. Then the set of all possible cuts on \eqn{a} is denoted by

\eqn{C_{a} = \{ (a, \frac{v_{1}^a + v_{2}^a}{2}), (a, \frac{v_{2}^a + v_{3}^a}{2}), \ldots, (a, \frac{v_{n_{a}-1}^a + v_{n_{a}}^a}{2})\}}

The set of possible cuts on all attributes is denoted by

\eqn{C_{A} = \cup_{a \in A}C_{a}}

The main points employed in this algorithm are to choose the cut \eqn{c_{max} \in C_{A}} which discerns the largest number of pairs of objects in
the decision-relative discernibility matrix \eqn{L = \{(x, y) \in U \times U : d(x) \neq d(y)\}}. Then insert \eqn{c_{max}} into a list \eqn{D} and remove it from \eqn{C_{A}}.
All pairs of objects from \eqn{L} discerned by \eqn{c_{max}} are deleted as well.

This function will detect and perform converting the real into nominal values according to states \code{FALSE} in parameter \code{nominal.attributes}.
And, it should be noted that the output of this function is a class containing cut values.
In order to generate new decision table, \code{\link{SF.applyDecTable}} is executed. It should be noted that
this algorithm needs a large memory and long time for discretization a big dataset.
}
\examples{
#################################################################
## Example: Determine cut values and generate new decision table
#################################################################
 dt.ex1 <- data.frame(c(1, 1.2, 1.3, 1.4, 1.4, 1.6, 1.3), c(2, 0.5, 3, 1, 2, 3, 1),
                             c(1, 0, 0, 1, 0, 1, 1))
colnames(dt.ex1) <- c("a", "b", "d")
decision.table <- SF.asDecisionTable(dataset = dt.ex1, decision.attr = 3, indx.nominal = c(3))

cut.values <- D.max.discernibility.matrix.RST(decision.table)

## generate new decision table
new.decTable <- SF.applyDecTable(decision.table, cut.values)
}
\author{
Lala Septem Riza
}
\references{
Jan G. Bazan, Hung Son Nguyen, Sinh Hoa Nguyen, Piotr Synak, and Jakub Wroblewski,
"Rough Set Algorithms in Classification Problem", Chapter 2
 In: L. Polkowski, S. Tsumoto and T.Y. Lin (eds.): Rough Set Methods and Applications
Physica-Verlag, Heidelberg, New York, p. 49 - 88 (2000).
}
\seealso{
\code{\link{D.local.discernibility.matrix.RST}}, \code{\link{D.discretize.quantiles.RST}},

\code{\link{D.discretize.equal.intervals.RST}}, and \code{\link{D.global.discernibility.heuristic.RST}}
}

