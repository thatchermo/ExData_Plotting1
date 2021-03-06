# Read and process data
elec.data = read.table("household_power_consumption.txt", sep=";", header=TRUE,
    na.strings="?")
elec.data$Time = strptime(paste(elec.data$Date,elec.data$Time), format="%d/%m/%Y %H:%M:%S")
elec.data$Date = as.Date(elec.data$Date, format="%d/%m/%Y")
elec.data = elec.data[elec.data$Date=="2007-02-01"|elec.data$Date=="2007-02-02", ]
# Create Graph
png(filename="plot2.png", width=480, height=480)
plot(elec.data$Time, elec.data$Global_active_power, type="l", 
    ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
