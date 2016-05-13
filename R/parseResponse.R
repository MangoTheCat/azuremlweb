
#' Extract data frames from httr response
#'
#' @param resp The httr response object
#'
#' @return A list of data frames, one for each output from the web service
#' @export
#'
parseResponse <- function(resp) {
  
  respList <- httr::content(resp)
  
  results <- respList$Results
  
  lapply(results, parseDataFrame)
  
}

#' Extract one data frame from the 
#'
#' @param result an element of the response object that corresponds to a single data frame
#'
#' @return A data frame typed according to the ColumnTypes element
#' @export
#'
parseDataFrame <- function(result) {
  
  if(result$type != "table") stop("All results must be tables (data.frames)")
  
  result <- result$value
  
  output <- list()
  for(i in 1:(length(result$ColumnNames))) {
    # Do something with the NULLs?
    
    # Extract the character vector
    x <- vapply(result$Values, function(x) x[[i]], "")
    # Use the type to convert it
    if(!is.null(result$ColumnTypes)) {
      x <- switch(result$ColumnTypes[[i]],
                  "Double" = as.numeric(x),
                  "String" = x,
                  "Int32" = as.integer(x),
                  "Int64" = as.numeric(x),
                  "Categorical" = factor(x),
                  "Numeric" = as.numeric(x),
                  x)
    }
    # Attach to the 
    output[[result$ColumnNames[[i]]]] <- x
  }
  output <- as.data.frame(output, stringsAsFactors = FALSE)
  
  output
}