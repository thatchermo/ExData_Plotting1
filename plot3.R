# Read and process data
elec.data = read.table("household_power_consumption.txt", sep=";", header=TRUE,
    na.strings="?")
elec.data$Time =
    strptime(paste(elec.data$Date,elec.data$Time), format="%d/%m/%Y %H:%M:%S")
elec.data$Date = as.Date(elec.data$Date, format="%d/%m/%Y")
elec.data =
    elec.data[elec.data$Date=="2007-02-01"|elec.data$Date=="2007-02-02", ]
# Create Graph
png(filename="plot3.png", width=480, height=480)
plot(elec.data$Time, elec.data$Sub_metering_1, type="l",
    ylab="Energy sub metering", xlab="")
points(elec.data$Time, elec.data$Sub_metering_2, type="l", col="red")
points(elec.data$Time, elec.data$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, lwd=2, col=c("black", "red", "blue"),
    legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
