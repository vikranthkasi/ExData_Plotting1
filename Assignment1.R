#read the file into table
db<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)

#subset the data frame to our needs

dd_sub<-db[db$Date=="1/2/2007",]
dd_sub2<-db[db$Date=="2/2/2007",]
db_sel<-rbind(dd_sub,dd_sub2)

#converting date from string to date format
db_sel[,1]<-as.Date(db_sel[,1],"%d/%m/%Y")
test<-db_sel
#converting Global active power to decimal from string
db_sel[,3]<-as.numeric(as.character(db_sel[,3]))

#Historgram png1
hist(db_sel$Global_active_power,col = "red",main="Global Active Power",xlab = "Global Active Power (killowatts)", ylab = "Frequency")

#combining date and time
db_sel$date_time<-paste(db_sel$Date,db_sel$Time)

#plot of date/time vs global active power
plot(strptime(db_sel$date_time, "%Y-%m-%d %H:%M:%S"), db_sel$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

#converting into numeric
db_sel$Sub_metering_1 <- as.numeric(as.character(db_sel$Sub_metering_1))
db_sel$Sub_metering_2 <- as.numeric(as.character(db_sel$Sub_metering_2))
db_sel$Sub_metering_3 <- as.numeric(as.character(db_sel$Sub_metering_3))
db_sel$Voltage <- as.numeric(as.character(db_sel$Voltage))

#plot of date/time v Sub metering 1 data
plot(strptime(db_sel$date_time, "%Y-%m-%d %H:%M:%S"), db_sel$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

#Adds line graph for date/time v Sub metering 2 data in red
lines(strptime(db_sel$date_time, "%Y-%m-%d %H:%M:%S"), db_sel$Sub_metering_2, type = "l", col = "red" )

#Adds line graph for date/time v Sub metering 3 data in blue
lines(strptime(db_sel$date_time, "%Y-%m-%d %H:%M:%S"), db_sel$Sub_metering_3, type = "l", col = "blue" )

#Adds legend to graph
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Sets graphing parameters so that 4 graphs are drawn by column
par(mfcol = c(2,2))


# Creates graph of date/time vs global active power data
plot(strptime(db_sel$date_time, "%Y-%m-%d %H:%M:%S"), db_sel$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power(kilowatts)")


#Creates 2nd graph in column 1 
#Creates plot of date/time v Sub metering 1 data
plot(strptime(db_sel$date_time, "%Y-%m-%d %H:%M:%S"), db_sel$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

#Adds line graph for date/time v Sub metering 2 data in red
lines(strptime(db_sel$date_time, "%Y-%m-%d %H:%M:%S"), db_sel$Sub_metering_2, type = "l", col = "red" )

#Adds line graph for date/time v Sub metering 3 data in blue
lines(strptime(db_sel$date_time, "%Y-%m-%d %H:%M:%S"), db_sel$Sub_metering_3, type = "l", col = "blue" )

#Adds legend to graph
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Creates first graph in column 2
#This graphs date/time v Voltage
plot(strptime(db_sel$date_time, "%Y-%m-%d %H:%M:%S"), db_sel$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")

#Creates second graph in column 2
#This plots datetime v global reactive power
plot(strptime(db_sel$date_time, "%Y-%m-%d %H:%M:%S"), db_sel$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")