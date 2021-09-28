#' GetPopulationNew function
#' This function read population data from the EURO dashboard
#' @export
#' 


GetPopulationNew<-function(){
  url <- parse_url("https://services.arcgis.com/5T5nSi527N4F7luB/ArcGIS/rest/services")
  url$path <- paste(url$path, "EURO_COVID19_ADM0_Cases/FeatureServer/0/query", sep = "/")
  url$query <- list(where = '1=1',
                    outFields = "*",
                    returnGeometry = "true",
                    f = "geojson")
  request <- build_url(url)
  PopulationData <- st_read(request) %>% st_drop_geometry() %>% 
    select(ADM0_NAME,WHO_CODE,Population=CENTER_LAT) %>%
    mutate(ADM0_NAME=str_to_title(ADM0_NAME))
  
  return(PopulationData)
}

