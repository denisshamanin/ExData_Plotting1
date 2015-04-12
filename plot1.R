plot1 <- function(){
        
        library(dplyr)
        library(lubridate)
        setwd("C:/Users/Denis/Google Drive/Coursera/Data Science/Exploratory Data Analysis/Week 1/ExData_Plotting1")
        df <- read.table("household_power_consumption.txt", sep = ";", col.names = c("Date", "Time",
                "Global_active_power", "Global_reactive_power", "Voltage", 
                "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                nrows = 2880, na.strings = "?", skip = 66637, stringsAsFactors = FALSE)
        
        png(filename = "plot1.png", width = 480, height = 480)
        
        hist(df$Global_active_power, col = "red", main = "Global Active Power", 
                xlab = "Global Active Power (kilowatts)")
        
        dev.off()
}