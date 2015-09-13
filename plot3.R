# Dataset obtained from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# on 09/13/15 at 1:18PM Mountain Time
# Downloaded manually and extracted to the below directory

setwd("E:/Documents/School/Coursera/4_Exploratory_Data_Analysis/Project1/Data")

# Read in the data and extract only the dates 2/1/2007 - 2/2/2007
file <- "household_power_consumption.txt"
df <- read.table(file, header = TRUE, sep = ";", nrows = 2075262, comment.char = "", na.strings = "?")
df <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007", ]
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$datetime <- paste(df$Date, df$Time)
df$datetime <- as.POSIXct(df$datetime)


# Now we want to make a multivariate plot showing
# the three Sub_metering, using a different color
# for each one and making a legend to tell the 
# difference between each one
png(file = "plot3.png")
plot(df$Sub_metering_1 ~ df$datetime, type = "l", xlab = "", ylab = "Energy sub metering")
points(df$Sub_metering_2 ~ df$datetime, type = "l", col = "Red")
points(df$Sub_metering_3 ~ df$datetime, type = "l", col = "Blue")
legend("topright", lty = c(1,1,1), lwd = c(2.5, 2.5), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
