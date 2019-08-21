
complete <-function(directory,id= 1:332)
{
  dat<-data.frame()
  
  
  for(pivot in id)
  {
    
    my_frame<-read.csv(paste(getwd(), "/", directory, "/", sprintf("%03d", pivot), ".csv", sep = ""),header=T)
    cases<-data.frame(pivot,sum(complete.cases(my_frame)))
    dat<-rbind(dat,cases)
  
  }
  
  colnames(dat)<-c('id','nobs')
  dat
}
  
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)

cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

cc <- complete("specdata", 54)
print(cc$nobs)

RNGversion("3.5.1")  
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
