## PLOT 3 OVERVIEW

##Reads in the "Individual household electric power consumption Data Set" available from the UC Irvine Machine Learning Repository, and produces a plot of 3 submeter consumptions in kilowatts for the dates February 1 and 2, 2007. 

##PLOT 3 STEP-BY-STEP

##1 plot3("name of file here") starts the function when the file name is passed on as the argument.
##2 read the named file into R and assigned to the power variable. 
##3 convert the date column into date format as recommended in the assignment instructions.
##4 subset the two days of interest out of the power data frame and assigned to new data frame named "df".
##5-7 reformate Sub_metering col's as a numeric vector's.
##8  reformate timestamp from 2 text strings to a single time stamp.
##9 generate plot with a y-axis label of "Global Active Power (kilowatts)" and x-axis as to the time with respect to Sub_metering_1.
##10 add a red line as to Sub_metering_2.
##11 add a blue line as to Sub_metering_3.
##7 save file as "plot3.png".
##8 close dev.
##9 print a statement to inform where the file has been saved.

plot3 <- function(file) {
  
  power <- read.table(file, header=TRUE, sep=";")
  
  power$Date <- as.Date(power$Date, format="%d/%m/%Y")
  
  df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
  
  df <- transform(df, Sub_metering_1 = as.numeric(Sub_metering_1))
  
  df <- transform(df, Sub_metering_2 = as.numeric(Sub_metering_2))
  
  df <- transform(df, Sub_metering_3 = as.numeric(Sub_metering_3))
  
  df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  plot(df$timestamp, df$Sub_metering_1, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  lines(df$timestamp, df$Sub_metering_2, col="red")
  
  lines(df$timestamp, df$Sub_metering_3, col="blue")
  
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
  
  dev.copy(png, file="plot3.png", width=480, height=480)
  
  dev.off()
  
  cat("Plot3.png has been saved in", getwd())
}