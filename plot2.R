
#1. read in Data
All_data <- read.csv("household_power_consumption.txt", na.strings = c("?",""), header=TRUE, sep= ";")

#2. change Date column from character to Date
All_data$Date <- as.Date(All_data$Date, format = "%d/%m/%Y")  

#3. create temp       

All_data$Time_to_format <- paste(All_data$Date, All_data$Time)

#3. Change Time column to Date\Time
All_data$Time <- strptime(All_data$Time_to_format, format = "%Y-%m-%d %H:%M:%S") 

#4. Extract Date of intrest '2007-02-01' and '2007-02-02' subset to variable working_data
working_data <- All_data[  All_data$Date  == as.Date('2007-02-01') |  All_data$Date  ==  as.Date('2007-02-02')  ,]             


#5. code for making  plots 2 and copying to file
png('plot2.png', width = 480, height = 480)
plot( working_data$Time,working_data$Global_active_power,type = 'l', ylab="Global Active Power (Kilowatts)", xlab="")
dev.off()