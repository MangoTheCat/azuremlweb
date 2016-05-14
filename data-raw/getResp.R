data(allsorts)

resp <- makeRequest(list(Input1=data.frame(Month = 4, OriginAirportID = 14122, Carrier = "AS"),
                            Input2=allsorts),
                       url = "https://ussouthcentral.services.azureml.net/workspaces/4a06ac88d985464f9e7b1c14594ce5c0/services/9f72f85b9e344a5184f8d20337c2f33e/execute?api-version=2.0&details=true",
                       auth="")

parseResponse(resp)


# Single Input Service ----------------------------------------------------

resp <- makeRequest(list(Input1=data.frame(Month = 4, OriginAirportID = 14122, Carrier = "AS")),
                    url = "https://ussouthcentral.services.azureml.net/workspaces/4a06ac88d985464f9e7b1c14594ce5c0/services/6ed02c968b014990a08e1448433b73ce/execute?api-version=2.0&details=true",
                    auth="")

parseResponse(resp)


