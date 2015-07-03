GetLotoResults(address){
  library(httr)
  library(XML)
  #Get latest loto ID number
  html <- htmlTreeParse(address,useInternalNodes = TRUE)
  numstr <- xpathSApply(html,"//u['Nro:']",xmlValue)[2]
  num <- as.numeric(strsplit(numstr," ")[[1]][4])
  
  #Get last 24 loto results numbers
  lotourl <- paste("http://tujugada.com.ar/loto_new.asp?sorteo=",num,sep = "")
  html <- htmlTreeParse(lotourl,useInternalNodes = TRUE)
  middle <- xpathSApply(html,"//td[@width='17%']",xmlValue)
  html <- htmlTreeParse(lotourl,useInternalNodes = TRUE)
  edges <- xpathSApply(html,"//td[@width='16%']",xmlValue)
  
  #middle <- as.numeric(strsplit(middle,"\t")[[1]])
  middle <- lapply(middle,function(x){ 
        n <- as.numeric(strsplit(x,"\t")[[1]]) 
        n[!is.na(n)] 
        }
      )
}