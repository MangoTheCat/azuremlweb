#' azuremlweb: Call an AzureML web service
#'
#' Makes it easier to test out a new AzureML web service. This package helps 
#' you make a POST request to an AzureML API and parse the response back into R 
#' data frames.
#' 
#'
#' @docType package
#' @name azuremlweb
NULL

#' A data frame with lots of types in it
#'
#' For use testing whether types are being converted correctly
#'
#' @format A data frame with 3 rows and 7 variables:
#' \describe{
#'   \item{Fac}{A factor variable with levels A,B and C}
#'   \item{Num}{Floating point number}
#'   \item{Int}{Strict R integers}
#'   \item{Intish}{Same as Int but not defined using 1L etc}
#'   \item{Date}{Standard R date}
#'   \item{Char}{Character data}
#'   \item{TimeStamp}{POSIXct stamps}
#' }
#' @source Simulated
"allsorts"
