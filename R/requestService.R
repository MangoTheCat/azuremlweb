
#' Make a POST request to AzureML service
#'
#' @param newdata A data frame to send to the web service
#' @param url If you supply the full URL then other options are not required
#' @param region The Azure region, such as ussouthcentral, europewest
#' @param workspace The workspace ID
#' @param service The service ID
#' @param auth Authentication token. Careful not to save this anywhere and check your .Rhistory
#' @param details Logical. If FALSE then column types are omitted from the response
#'
#' @return
#' @export
#'
#' @examples
requestService <- function(newdata, url = NULL, region = "ussouthcentral",
                           workspace, service, auth = NULL, details = TRUE) {

  # Checks
  stopifnot(is.logical(details))
  details <- ifelse(details, "true", "false")

  if(is.null(url)) {
    url <- paste0("https://", region, ".services.azureml.net/workspaces",
                  workspace, "/services/", service, "/execute?api-version=2.0&details=", details)
  }
}
