#' GetEpiData function
#' This function read the running epi data online
#' @export
#'
#'

ToJsonForAgol<-function(data){
  numbercol<-ncol(data)
  numberrow<-nrow(data)

  allrows_<-''
  for(r in seq(1,numberrow-1,1)){
    row_<-'"attributes": {'
    for(c in seq(1,numbercol-1,1)){
      if (class(data[r,c])=='character'){
        variable<-paste0('"',data[r,c],'"')
      } else {
        variable<-data[r,c]
      }
      row<-paste0('"',colnames(data)[c],'" : ',variable,',')
      row_<-paste0(row_,row)
    }
    if (class(data[r,numbercol])=='character'){
      variable_last<-paste0('"',data[r,numbercol],'"')
    } else {
      variable_last<-data[r,numbercol]
    }
    row_<-paste0(row_,
                 '"',
                 colnames(data)[numbercol],'" : ',variable_last,'}},{')
    allrows_<-paste0(row_,allrows_)
    row_last_<-'"attributes": {'
    for(c in seq(1,numbercol-1,1)){
      if (class(data[numberrow,c])=='character'){
        variable_<-paste0('"',data[numberrow,c],'"')
      } else {
        variable_<-data[numberrow,c]
      }
      row_last<-paste0('"',colnames(data)[c],'" : ',variable_,',')
      row_last_<-paste0(row_last_,row_last)
    }
    if (class(data[numberrow,numbercol])=='character'){
      variable_last_<-paste0('"',data[numberrow,numbercol],'"')
    } else {
      variable_last_<-data[numberrow,numbercol]
    }
    row_last_<-paste0(row_last_,
                      '"',
                      colnames(data)[numbercol],'" : ',variable_last_,'}}]')
    finalstring<-paste0('[{',allrows_,row_last_)
  }
  return(finalstring)
}
