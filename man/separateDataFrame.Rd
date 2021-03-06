% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/buildBody.R
\name{separateDataFrame}
\alias{separateDataFrame}
\title{Separate a dataset into the list structure required for the POST request}
\usage{
separateDataFrame(dataset)
}
\arguments{
\item{dataset}{A data.frame}
}
\value{
list with the ColumnNames (char vector) and Values (char matrix)
}
\description{
The values of the dataset are converted to a matrix. The column names are
stored in a separte list item
}
\examples{
separateDataFrame(data.frame(x=1:5, y=LETTERS[1:5]))
}

