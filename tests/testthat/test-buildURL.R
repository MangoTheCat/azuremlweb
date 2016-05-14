context("Request URL")

test_that("Calling the right URL", {

  expect_equal(buildURL(region = "ussouthcentral",
                        workspace = "8550bbba99572fc47e18e5fdd53e43e2",
                        service = "4e7ebd7ad816cd9dd1cb1b17c4cdb0c7",
                        details = TRUE),
               "https://ussouthcentral.services.azureml.net/workspaces/8550bbba99572fc47e18e5fdd53e43e2/services/4e7ebd7ad816cd9dd1cb1b17c4cdb0c7/execute?api-version=2.0&details=true")

})
