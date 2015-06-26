getTableFromWeb <- function(address){
  con = url(address)
  htmlCode = readLines(con)
  close(con)
  
}