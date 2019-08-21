directory<-"specdata"
threshold<-150
corr <-function(directory,threshold=0)
{
  dir_file<-paste(getwd(), "/", directory, "/", sep = "")
  files<-dir(dir_file)
  output <- numeric()
  for(i in files)
  {
    corval<-0
    file_read<-read.csv(paste(dir_file,i,sep=''))
    com_case<-sum(complete.cases(file_read))
      if(com_case>threshold){
        datos<-file_read[complete.cases(file_read),]
        sulfate <- datos[["sulfate"]]
        nitrate <- datos[["nitrate"]]
        corval <- cor(nitrate,sulfate,use="pairwise.complete.obs")            
        output <- c(output,corval)
      }
    
  }
  output
}


cr <- corr("specdata", 150)

head(cr)
summary(cr)

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)



cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))


cr <- corr("specdata")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)
