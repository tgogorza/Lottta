GetNextNumbers <- function(){
  library(dplyr)
  source("GetLotoTable.R")
  #source("GetQuiniTable.R")
  source("GetLotoResults.R")
  
  urls <- read.csv("urls.txt")
  
  lotostatsurl <- filter(urls,Game=="Loto")$URL
  lotostats <- GetLotoTable(lotostatsurl)
  
  lotoplaysurl <- filter(urls,Game=="LotoLatest")$URL
  lotoplays <- GetLotoResults(lotoplaysurl)
 
  #DO SOME MAGIC TO DETERMINE THE NEXT 6 NUMBERS TO PLAY
  nextplay <- c(7,13,17,22,29,39)
  #Output
  cat(nextplay)
  
  
  #EXPERIMENTATION
  
  #add row sums
  lotoplays <- mutate(lotoplays,sum = rowSums(lotoplays), dif = c(0,abs(diff(sum))))
  #plots
  ggplot(lotoplays, aes(x=as.numeric(rownames(lotoplays)),y=lotoplays$sum),group=1) + geom_line() + geom_point()
  ggplot(lotoplays, aes(x=as.numeric(rownames(lotoplays)),y=lotoplays$dif),group=1) + geom_line() + geom_point()
  
  ggplot(lotoplays, aes(x=as.numeric(rownames(lotoplays)),y=lotoplays[[1]]),group=1) + geom_line() + geom_point()
  
  ggplot(lotostats, aes(x=as.numeric(rownames(lotostats)),y=lotostats$totveces)) + geom_line() + geom_point()
  ggplot(lotostats, aes(x=as.numeric(rownames(lotostats)),y=lotostats$totatraso)) + geom_line() + geom_point()
  
  histogram <- hist(c(lotoplays$X1,lotoplays$X2,lotoplays$X3,lotoplays$X4,lotoplays$X5,lotoplays$X6), breaks = 0:41)
}