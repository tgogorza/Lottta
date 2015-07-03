GetQuiniTable <- function(address){
  library(httr)
  library(XML)
  
  html <- htmlTreeParse(address,useInternalNodes = TRUE)
  numbers <- xpathSApply(html,"//td[@width='10%']",xmlValue)
  numbers <- numbers[3:length(numbers)]
  numbers <- as.numeric(numbers)
  veces <- xpathSApply(html,"//td[@width='8%']",xmlValue)  
  veces <- veces[6:length(veces)]
  veces <- as.numeric(veces)
  atraso <- xpathSApply(html,"//td[@width='9%']",xmlValue)  
  atraso <- atraso[6:length(atraso)]
  atraso <- as.numeric(atraso)
  
#Map col indexes and split vectors
#   col1index <- seq(1, length(nvalues), by = 4)
#   col2index <- seq(2, length(nvalues), by = 4)
#   col4index <- seq(3, length(nvalues), by = 4)
#   col6index <- seq(4, length(nvalues), by = 4)
#   col3index <- seq(1, length(nvalues2), by = 5)
#   col5index <- seq(2, length(nvalues2), by = 5)
#   col7index <- seq(3, length(nvalues2), by = 5)
#   col8index <- seq(4, length(nvalues2), by = 5)
#   col9index <- seq(5, length(nvalues2), by = 5)
  
  num <- nvalues[col1index]
  tatraso <- nvalues[col2index]
  tveces <- nvalues2[col3index]
  datraso <- nvalues[col4index]
  dveces <- nvalues2[col5index]
  satraso <- nvalues[col6index]
  sveces <- nvalues2[col7index]
  totatraso <- nvalues2[col8index]
  totveces <- nvalues2[col9index]
  
  stats <- data.frame(num,tatraso,tveces,datraso,dveces,satraso,sveces,totatraso,totveces)
  #add averago atraso
  
  #return stats table
  return(stats)
  
  #filter(stats,totatraso > 7)
  #filter(stats,totveces > 660)
}