
#' Make a POST request to AzureML service
#'
#' @param datasets A named list of data frames to send to the web service.
#' The names must match the names of the web inputs in Azure, eg. list(WebInput = data.frame(x=1, y=2))
#' @param url If you supply the full URL then other options are not required
#' @param region The Azure region, such as ussouthcentral, europewest
#' @param workspace The workspace ID
#' @param service The service ID
#' @param auth Authentication token. Careful not to save this anywhere and
#' check your .Rhistory
#' @param details Logical. If FALSE then column types are omitted from the
#' response
#'
#' @return An httr response object
#' @export
#'
#' @examples
#' \dontrun{
#' makeRequest(list(WebInput = data.frame(x=1:5, y=LETTERS[1:5])),
#'                region = "ussouthcentral",
#'                workspace = "8550bbba99572fc47e18e5fdd53e43e2",
#'                service = "4e7ebd7ad816cd9dd1cb1b17c4cdb0c7",
#'                auth = "xxxxxxxxxxxx==")
#' }
makeRequest <- function(datasets, url = NULL, region = "ussouthcentral",
                        workspace=NULL, service=NULL, auth = NULL, details = TRUE) {
  
  if(is.null(url)) {
    url <- buildURL(region, workspace, service, details)
  }
  
  # Build the request list. The names must match the names of the web inputs in Azure
  req <- buildRequestList(datasets)
  
  if(is.null(auth)) {
    auth <- Sys.getenv("AZUREML_APIKEY")
    if(auth=="") {
      stop("Either set the AZUREML_APIKEY environment variable or pass auth token")
    }
  }
  auth <- paste("Bearer", auth, sep = " ")
  
  resp <- httr::POST(url = url, body = req, encode = "json",
                     httr::add_headers("Authorization" = auth,
                                       "Content-Type" = "application/json"))
  resp
}