
      ## Read Household Power data
      file <- "household_power_consumption.txt"
      dataset <- read.table(file,header=TRUE,sep=";",colClasses="character",na.strings="?")
      dataset <- rbind(dataset[dataset$Date=="1/2/2007",],dataset[dataset$Date=="2/2/2007",])
      dataset[,3] <- as.numeric(dataset[,3])
      
      ## Create a date field with time
      datetime <- paste(dataset[,1],dataset[,2])
      datetime <- strptime(datetime,format="%d/%m/%Y %H:%M:%S")
      dataset <- cbind(dataset,datetime)
      
      
      ## Generate the plot
      png("plot2.png")
      plot(dataset[,10],dataset[,3],type="l",xlab="",ylab="Global Active Power (kilowatts)")
      dev.off()      
      