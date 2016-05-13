
#' Build request list
#'
#' @param datasets A named list of data frames to send to the web service.
#' The names must match the names of the web inputs in Azure, eg. list(WebInput = data.frame(x=1, y=2))
#'
#' @return A list ready for converting the JSON
#' @export
#'
#' @examples
#' buildRequestList(list(WebInput = data.frame(x=1:5, y=LETTERS[1:5])))
buildRequestList <- function(datasets) {


  values <- as.matrix(datasets[[1]])
  dimnames(values) <- NULL

  InputList <- list(names(datasets[[1]]), values)
  names(InputList) <- c(names(datasets)[1], "Values")

  req <- list(
    Inputs = InputList
  )

  req

}
