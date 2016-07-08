
#' Make a POST request to AzureML service and parse the reponse
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
#' @return A list of output data frames. If the service responds with an error code a warnring is printed and the httr::response object is returned
#' @export
#'
#' @examples
#' \dontrun{
#' azuremlService(list(WebInput = data.frame(x=1:5, y=LETTERS[1:5])),
#'                region = "ussouthcentral",
#'                workspace = "8550bbba99572fc47e18e5fdd53e43e2",
#'                service = "4e7ebd7ad816cd9dd1cb1b17c4cdb0c7",
#'                auth = "xxxxxxxxxxxx==")
#' }
azuremlService <- function(datasets, url = NULL, region = "ussouthcentral",
                           workspace=NULL, service=NULL, auth = NULL, details = TRUE) {

  # Make the request
  resp <- makeRequest(datasets = datasets, url = url, region = region,
                      workspace = workspace, service = service, auth = auth,
                      details = details)

  # Report errors?
  if (resp$status_code != 200) {
    respContent <- httr::content(resp)
    stpMsg <- paste(c("Request unsuccessful. Status code ", resp$status_code),
                    jsonlite::toJSON(respContent$error, pretty = TRUE), collapse = "\n")
    warning(stpMsg)
    return(invisible(resp))
  }

  # Parse the response
  parseResponse(resp)

}
