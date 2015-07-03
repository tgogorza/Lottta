GetLotoTable <- function(address){
  library(httr)
  library(XML)
  
  html <- htmlTreeParse(address,useInternalNodes = TRUE)
  values <- xpathSApply(html,"//td[@width='10%']",xmlValue)
  values <- values [6:length(values)]
  nvalues <- as.numeric(values)
  values2 <- xpathSApply(html,"//td[@width='11%']",xmlValue)  
  values2 <- values2[6:length(values2)]
  nvalues2 <- as.numeric(values2)
  
  col1index <- seq(1, length(nvalues), by = 4)
  col2index <- seq(2, length(nvalues), by = 4)
  col4index <- seq(3, length(nvalues), by = 4)
  col6index <- seq(4, length(nvalues), by = 4)
  col3index <- seq(1, length(nvalues2), by = 5)
  col5index <- seq(2, length(nvalues2), by = 5)
  col7index <- seq(3, length(nvalues2), by = 5)
  col8index <- seq(4, length(nvalues2), by = 5)
  col9index <- seq(5, length(nvalues2), by = 5)
  
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