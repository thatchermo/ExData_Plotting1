# Read and process data
elec.data = read.table("household_power_consumption.txt", sep=";", header=TRUE,
    na.strings="?")
elec.data$Time =
    strptime(paste(elec.data$Date,elec.data$Time), format="%d/%m/%Y %H:%M:%S")
elec.data$Date = as.Date(elec.data$Date, format="%d/%m/%Y")
elec.data =
    elec.data[elec.data$Date=="2007-02-01"|elec.data$Date=="2007-02-02", ]
# Create Graph
png(filename="plot4.png", width=480, height=480)
par(mfcol=c(2,2))
# First graph
plot(elec.data$Time, elec.data$Global_active_power, type="l", 
    ylab="Global Active Power", xlab="")
# Second graph
plot(elec.data$Time, elec.data$Sub_metering_1, type="l",
    ylab="Energy sub metering", xlab="")
points(elec.data$Time, elec.data$Sub_metering_2, type="l", col="red")
points(elec.data$Time, elec.data$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, lwd=2, col=c("black", "red", "blue"), bty="n",
    legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Third graph
plot(elec.data$Time, elec.data$Voltage, xlab="datetime", ylab="Voltage", type="l")
# Fourth graph
with(elec.data, plot(Time, Global_reactive_power, xlab="datetime", type="l"))
dev.off()
