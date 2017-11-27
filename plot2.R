## PLOT 2 OVERVIEW

##Reads in the "Individual household electric power consumption Data Set" available from the UC Irvine Machine Learning Repository, and produces a plot of Global Active Power consumption in kilowatts for the dates February 1 and 2, 2007. 

##PLOT 2 STEP-BY-STEP

##1 plot2("name of file here") starts the function when the file name is passed on as the argument.
##2 read the named file into R and assigned to the power variable. 
##3 convert the date column into date format as recommended in the assignment instructions.
##4 subset the two days of interest out of the power data frame and assigned to new data frame named "df".
##5 reformate Global_active_power col as a numeric vector.
##6 reformate timestamp from 2 text strings to a single time stamp.
##7 generate plot with the title "Global Active Power", and a y-axis label of "Global Active Power (kilowatts)".
##7 save file as "plot2.png".
##8 close dev.
##9 print a statement to inform where the file has been saved.

plot2 <- function(file) {
  
  power <- read.table(file, header=TRUE, sep=";")
  
  power$Date <- as.Date(power$Date, format="%d/%m/%Y")
  
  df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
  
  df <- transform(df, Global_active_power = as.numeric(Global_active_power))
  
  df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  dev.copy(png, file="plot2.png", width=480, height=480)
  
  dev.off()
  
  cat("Plot2.png has been saved in", getwd())
}