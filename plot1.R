plot1 <- function(){
               
        setwd("C:/Users/Denis/Google Drive/Coursera/Data Science/Exploratory Data Analysis/Week 1/ExData_Plotting1")
        
        # reading required data for 2007-02-01 and 2007-02-02
        # by exploring the head one can find out that each date has exactly 1440 records
        # and that relevant data starts at line 66638
        df <- read.table("household_power_consumption.txt", sep = ";", col.names = c("Date", "Time",
                "Global_active_power", "Global_reactive_power", "Voltage", 
                "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                nrows = 2880, na.strings = "?", skip = 66637, stringsAsFactors = FALSE)
        
        # open png device 
        png(filename = "plot1.png", width = 480, height = 480)
        
        # drawing graph
        hist(df$Global_active_power, col = "red", main = "Global Active Power", 
                xlab = "Global Active Power (kilowatts)")
        
        # close png device
        dev.off()
}