#' GetEpiData function
#' This function read the running epi data online
#' @export
#'
#'


ToJsonForAgol<-function(data){

  json_to_upload<-toJSON(data)
  json_to_upload<-json_to_upload %>% str_replace('"','\"')
  json_to_upload<-json_to_upload %>% str_replace(']','}]')
  json_to_upload<-json_to_upload %>% str_replace_all('\\},\\{','\\}\\},\\{\"attributes\":{')
  json_to_upload<-json_to_upload %>% str_replace('\\[','\\[\\{\"attributes\":')

 return(json_to_upload)
}
