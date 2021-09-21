#Packages needed to use all of these packages
#Some custom packages make use of other custom packages, important to have them all downloaded

Packages_CRAN<-c('stats','ggplot2','hablar','devtools','readxl','Rcpp','zoo','dplyr','tidyr','httr','jsonlite','lubridate','cowplot','stringr','stats','imputeTS')
Packages_Custom<-c('WHOCountryNames',
                   'RtChart',
                   'BuildExtendedEpiDataset',
                   'SpaguettiPlot',
                   'ReadSeverityExcel','GetEpiData','PHSMChart','TableIndicators')

for (i in Packages_CRAN) {
  print(i)
  if (!i %in% installed.packages())
  {install.packages(i)}
  library(i, character.only = TRUE)
}

for (i in Packages_Custom) {
  print(i)
  if (!i %in% installed.packages())
  {install_github(paste0('WHOEURO-ECDC/Packages/',i))}
  library(i, character.only = TRUE)
}