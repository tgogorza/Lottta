GetLotoResults <- function(address){
  library(httr)
  library(XML)
  #Get latest loto ID number
  html <- htmlTreeParse(address,useInternalNodes = TRUE)
  numstr <- xpathSApply(html,"//u['Nro:']",xmlValue)[2]
  latestdraft <- as.numeric(strsplit(numstr," ")[[1]][4])
  #Generate IDs for the last 24 drafts
  lotonums <- seq(from = latestdraft-24, to = latestdraft)
  alldrafts <- lapply(lotonums,GetDraftNumbers)
  alldrafts <- do.call(rbind, alldrafts)
  alldrafts <- data.frame(alldrafts)
  #names(alldrafts) <- c("1","2","3","4","5","6")
  return(alldrafts)
}

GetDraftNumbers <- function(draftnum){
  
  #Get last 24 loto results numbers
  lotourl <- paste("http://tujugada.com.ar/loto_new.asp?sorteo=",draftnum,sep = "")
  html <- htmlTreeParse(lotourl,useInternalNodes = TRUE)
  middle <- xpathSApply(html,"//td[@width='17%']",xmlValue)
  html <- htmlTreeParse(lotourl,useInternalNodes = TRUE)
  edges <- xpathSApply(html,"//td[@width='16%']",xmlValue)
  
  #Scrape numbers 2nd to 5th 
  middle <- lapply(middle,function(x){ 
                                      n <- as.numeric(strsplit(x,"\t")[[1]]) 
                                      n[!is.na(n)] 
                                     }
                                  )
  middle <- as.numeric(middle)
  
  #Scrape numbers 1st and 6th 
  edges <- lapply(edges,function(x){ 
                                    n <- as.numeric(strsplit(x,"\t")[[1]]) 
                                    n[!is.na(n)] 
                                   }
                                )
  edges <- as.numeric(edges)
  
  #Create data frame with numbres for loto tradicional, desquite and sale o sale
  edges <- matrix(edges,3,2,byrow = TRUE)
  middle <- matrix(middle,3,4,byrow = TRUE)
  numbers <- cbind(edges[,1],middle,edges[,2])
}