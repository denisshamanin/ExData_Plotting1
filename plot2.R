plot2 <- function(){
        
        library(dplyr)
        library(lubridate)
        setwd("C:/Users/Denis/Google Drive/Coursera/Data Science/Exploratory Data Analysis/Week 1/ExData_Plotting1")
        df <- read.table("household_power_consumption.txt", sep = ";", 
                         col.names = c("Date", "Time","Global_active_power", 
                                       "Global_reactive_power", "Voltage", 
                                        "Global_intensity", "Sub_metering_1", 
                                       "Sub_metering_2", "Sub_metering_3"), 
                         nrows = 2880, na.strings = "?", skip = 66637, stringsAsFactors = FALSE)
        # create a merged date and time column
        df <- mutate(df, DateTime = paste(Date, Time))
        df <- mutate(df, DateTime = dmy_hms(DateTime))
        
        # open png device 
        png(filename = "plot2.png", width = 480, height = 480)
        
        plot(df$DateTime, df$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)",
              xlab = "")
        
        # close png device
        dev.off()
}