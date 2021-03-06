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

# Now we want to create a hitogram showing
# the frequency of the values of Global_active_power
# and save it to a png 
png(file = "plot1.png")
hist(df$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")
dev.off()