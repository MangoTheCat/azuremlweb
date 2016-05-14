context("Request body")

test_that("Multiple inputs work", {
  
  expect_equal(buildBody(list(Input1=data.frame(Month = 4, OriginAirportID = 14122, Carrier = "AS"),
                              Input2=allsorts)),
               
  structure(list(Inputs = structure(list(Input1 = structure(list(
    ColumnNames = c("Month", "OriginAirportID", "Carrier"), Values = structure(c("4", 
    "14122", "AS"), .Dim = c(1L, 3L))), .Names = c("ColumnNames", 
    "Values")), Input2 = structure(list(ColumnNames = c("Fac", "Num", 
    "Int", "Intish", "Date", "Char", "TimeStamp"), Values = structure(c("A", 
    "B", "C", "1.1", "2.2", "3.3", "1", "2", "3", "1", "2", "3", 
    "2016-05-01", "2016-05-02", "2016-05-03", "iam", "a", "fish", 
    "2016-05-14 22:00:03", "2016-05-14 22:00:04", "2016-05-14 22:00:05"
    ), .Dim = c(3L, 7L))), .Names = c("ColumnNames", "Values"))), .Names = c("Input1", 
    "Input2"))), .Names = "Inputs"))
})