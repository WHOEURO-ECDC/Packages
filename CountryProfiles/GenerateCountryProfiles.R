ListCountries<-c('Belgium','Ireland','United Kingdom','Netherlands','Luxembourg')
SeverityExcel<-'C:/Users/romanc/Documents/GitHub/HIM/Shiny_PHSM/updating_process/rawdata_to_update/SeverityIndex.xlsx'
for (Country in ListCountries){  
  render("CountryProfile_Creation.Rmd", output_file=paste0("CountryProfile_",Country),word_document(reference_doc= "Template_CP.docx"))
}