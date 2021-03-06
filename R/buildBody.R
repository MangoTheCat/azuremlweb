
#' Build the body of the request
#'
#' @param datasets A named list of data frames to send to the web service.
#' The names must match the names of the web inputs in Azure, eg. list(WebInput = data.frame(x=1, y=2))
#'
#' @return A list ready for converting the JSON
#' @export
#'
#' @examples
#' buildBody(list(WebInput = data.frame(x=1:5, y=LETTERS[1:5])))
buildBody <- function(datasets) {


  values <- as.matrix(datasets[[1]])
  dimnames(values) <- NULL

  req <- list(Inputs = lapply(datasets, separateDataFrame))
  req
}

#' Separate a dataset into the list structure required for the POST request
#'
#' The values of the dataset are converted to a matrix. The column names are
#' stored in a separte list item
#'
#' @param dataset A data.frame
#'
#' @return list with the ColumnNames (char vector) and Values (char matrix)
#' @export
#'
#' @examples
#' separateDataFrame(data.frame(x=1:5, y=LETTERS[1:5]))
separateDataFrame <- function(dataset) {
  # Might need to pass options to charConvertColumn
  values <- do.call("cbind", lapply(dataset, charConvertColumn))
  dimnames(values) <- NULL

  list(ColumnNames=names(dataset),
       Values = values)
}

#' Controlled conversion of vectors to characer vectors
#'
#' @param x A vector
#'
#' @return Character vector
#' 
charConvertColumn <- function(x) {
  switch(class(x)[1],
         "POSIXct" = format(x, "%Y-%m-%d %H:%M:%S %Z"),
         as.character(x))
}
