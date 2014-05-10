
      ## Read Household Power data
      file <- "household_power_consumption.txt"
      dataset <- read.table(file,header=TRUE,sep=";",colClasses="character",na.strings="?")
      dataset <- rbind(dataset[dataset$Date=="1/2/2007",],dataset[dataset$Date=="2/2/2007",])
      dataset[,7] <- as.numeric(dataset[,7])
      dataset[,8] <- as.numeric(dataset[,8])
      dataset[,9] <- as.numeric(dataset[,9])
      
      ## Create a date field with time
      datetime <- paste(dataset[,1],dataset[,2])
      datetime <- strptime(datetime,format="%d/%m/%Y %H:%M:%S")
      dataset <- cbind(dataset,datetime)
      
      
      ## Generate the plot
      png("plot3.png")
      plot(dataset[,10],dataset[,7],type="n",xlab="",ylab="Energy sub metering")
      points(dataset[,10],dataset[,7],type="l")
      points(dataset[,10],dataset[,8],type="l",col="red")
      points(dataset[,10],dataset[,9],type="l",col="blue")
      legend("topright",names(dataset[,7:9]),col=c("black","red","blue"),lty=1)
      dev.off() 