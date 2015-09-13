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

# We want to create multiple plots to be seen at the 
# same time, the first being the changes of Global_active_power
# over the days, the next one will be the change in Voltage
# over the days, the third will be the plot from plot3.R
# and the fourth will be the changes of Global_reactive_power
# over the days
png(file = "plot4.png")

# We set our mfrow and mar to be able to see all 4 plots
# in one picture nicely
par(mfrow = c(2,2), mar = c(5.1, 4.1, 1, 2.1))

# Plot 1
with(df, plot(Global_active_power ~ datetime, xlab = "", ylab = "Global Active Power", type = "l"))

# Plot 2
with(df, plot(Voltage ~ datetime, type = "l", ylab = "Voltage"))

# Plot 3
plot(df$Sub_metering_1 ~ df$datetime, type = "l", xlab = "", ylab = "Energy sub metering")
points(df$Sub_metering_2 ~ df$datetime, type = "l", col = "Red")
points(df$Sub_metering_3 ~ df$datetime, type = "l", col = "Blue")
legend("topright", lty = c(1,1,1), lwd = c(2.5, 2.5), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot 4
with(df, plot(Global_reactive_power ~ datetime, type = "l"))

dev.off()