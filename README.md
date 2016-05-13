# azuremlweb

[![Project Status: WIP - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)


Call an AzureML web service from R

```r
# Use your numbers (below are not real numbers)
# Be careful where you put your auth tokens
resp <-  requestService(list(WebInput = data.frame(x=1:5, y=LETTERS[1:5])),
                region = "ussouthcentral",
                workspace = "8550bbba99572fc47e18e5fdd53e43e2",
                service = "4e7ebd7ad816cd9dd1cb1b17c4cdb0c7",
                auth = "YTHDwNeuZbQLWHjOEKzMWjVihThTcmsIdRRFkSsvHaFoxZcKTjdFmFPaIsfN+OEdoZlGttMJQrzUPOvvLeCej==")
                
httr::content(resp)
```

The content parser is coming [#1](https://github.com/MangoTheCat/azuremlweb/issues/1)
