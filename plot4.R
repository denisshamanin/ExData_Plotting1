plot4 <- function(){
        
        library(dplyr)
        library(lubridate)
        setwd("C:/Users/Denis/Google Drive/Coursera/Data Science/Exploratory Data Analysis/Week 1/ExData_Plotting1")
        
        # reading required data for 2007-02-01 and 2007-02-02
        # by exploring the head one can find out that each date has exactly 1440 records
        # and that relevant data starts at line 66638
        df <- read.table("household_power_consumption.txt", sep = ";", 
                         col.names = c("Date", "Time", "Global_active_power", 
                                       "Global_reactive_power", "Voltage", 
                                       "Global_intensity", "Sub_metering_1", 
                                       "Sub_metering_2", "Sub_metering_3"), 
                         nrows = 2880, na.strings = "?", skip = 66637, stringsAsFactors = FALSE)
        
        # create a merged date and time column
        df <- mutate(df, DateTime = paste(Date, Time))
        df <- mutate(df, DateTime = dmy_hms(DateTime))
        
        # open png device 
        png(filename = "plot4.png", width = 480, height = 480)
        
        # setting framing order for multiple graphs on canvas
        par(mfrow = c(2,2))
        
        # graph 1
        plot(df$DateTime, df$Global_active_power, type="l", ylab = "Global Active Power", xlab = "")
        # graph 2
        plot(df$DateTime, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
        # graph 3
        plot(df$DateTime, df$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
        lines(df$DateTime, df$Sub_metering_1)
        lines(df$DateTime, df$Sub_metering_2, col = "red")
        lines(df$DateTime, df$Sub_metering_3, col = "blue")
        # adding legend at top right corner
        legend(x = "topright", y = NULL, col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               lty = c(1, 1), lwd = 2, bty = "n")
        
        # graph 4
        plot(df$DateTime, df$Global_reactive_power, type = "l", xlab = "datetime")
        
        # close png device
        dev.off()
}