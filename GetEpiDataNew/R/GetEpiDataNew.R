#' GetEpiDataNew function
#' This function read the running epi data online
#' @export
#' 


GetEpiDataNew<-function(){
  url <- parse_url("https://services.arcgis.com/5T5nSi527N4F7luB/ArcGIS/rest/services")
  url$path <- paste(url$path, "EURO_COVID19_Running_v3/FeatureServer/0/query", sep = "/")
  url$query <- list(where = '1=1',
                    outFields = "*",
                    returnGeometry = "false",
                    f = "geojson")
  request <- build_url(url)
  EpiData <- st_read(request) %>% st_drop_geometry() %>% 
    mutate(DateReport=as.Date(format(as.POSIXct(DateReport/1000, origin="1970-01-01"),'%Y-%m-%d'))) 
}

