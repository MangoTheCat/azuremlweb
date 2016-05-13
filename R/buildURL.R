#' Build an AzureML service URL from workspace info
#'
#' @param region The Azure region, such as ussouthcentral, europewest
#' @param workspace The workspace ID
#' @param service The service ID
#' @param details Logical. Should be TRUE for now
#'
#' @return the url as a character
#' @export
#'
#' @examples
#' buildURL(region = "ussouthcentral",
#'          workspace = "8550bbba99572fc47e18e5fdd53e43e2",
#'          service = "4e7ebd7ad816cd9dd1cb1b17c4cdb0c7",
#'          details = TRUE)
buildURL <- function(region, workspace, service, details = TRUE) {

  # Checks
  stopifnot(is.logical(details))
  details <- ifelse(details, "true", "false")

  paste0("https://", region, ".services.azureml.net/workspaces/",
         workspace, "/services/", service, "/execute?api-version=2.0&details=", details)
}
