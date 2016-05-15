# Make a data frame with all sorts of types

allsorts <- data.frame(Fac = factor(LETTERS[1:3]),
                       Num = c(1.1, 2.2, 3.3),
                       Int = c(1L, 2L, 3L),
                       Intish = 1:3,
                       Date = as.Date(16922:16924, origin = "1970-01-01"),
                       Char = c("iam", "a", "fish"),
                       TimeStamp = as.POSIXct(1463259602 + 1:3, origin="1970-01-01", tz = "UTC"))

use_data(allsorts, overwrite = TRUE)
write.csv(allsorts, file = "data-raw/allsorts.csv", row.names = FALSE)
