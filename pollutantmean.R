
pollutantmean <-function(directory,pollutant,id= 1:332)
{
  my_mean<-c()
  
  for(pivot in id)
  {

    my_frame<-read.csv(paste(getwd(), "/", directory, "/", sprintf("%03d", pivot), ".csv", sep = ""))
    read_data<-my_frame[pollutant]
    my_mean<- c(my_mean,read_data[!is.na(read_data)])
    #my_list<-c(my_list,my_frame)
  }
  mean(my_mean)
  
 # mean(my_mean)
}

pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "sulfate", 34)
pollutantmean("specdata", "nitrate")


