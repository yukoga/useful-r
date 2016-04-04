employee.IQ.JP <- data.frame(
  IQ = c(78, 84, 84, 85, 87, 91, 92, 94, 94, 96, 99, 105, 105, 106, 108, 112, 113, 115, 118, 134),
  JobPerformance = c(9, 13, 10, 8, 7, 7, 9, 9, 11, 7, 7, 10, 11, 15, 10, 10, 12, 14, 16, 12)
)
employee.IQ.JP

# create missing data flag
library(ggplot2)
employee.IQ.JP$MCAR <- employee.IQ.JP$JobPerformance
employee.IQ.JP$MCAR[c(1, 3, 10, 20)] <- NA
employee.IQ.JP$MCAR.is.missing <- as.factor(as.integer(is.na(employee.IQ.JP$MCAR)))
p <- ggplot(data = employee.IQ.JP, aes(x=IQ, y=JobPerformance, colour = MCAR.is.missing)) + geom_point(aes(shape = MCAR.is.missing), size = 5) + theme_bw() %+replace% theme(legend.position = "bottom")
print(p)

employee.IQ.JP$MAR <- employee.IQ.JP$JobPerformance
employee.IQ.JP$MAR[1:5] <- NA
employee.IQ.JP$MAR.is.missing <- as.factor(as.integer(is.na(employee.IQ.JP$MAR)))
p2 <- ggplot(data = employee.IQ.JP, aes(x=IQ, y=JobPerformance, colour = MAR.is.missing)) + geom_point(aes(shape = MAR.is.missing), size = 5) + theme_bw() %+replace% theme(legend.position = "bottom")
print(p2)

employee.IQ.JP$MNAR <- employee.IQ.JP$JobPerformance
employee.IQ.JP$MNAR[c(4:6, 10:11)] <- NA
employee.IQ.JP$MNAR.is.missing <- as.factor(as.integer(is.na(employee.IQ.JP$MNAR)))
p3 <- ggplot(data = employee.IQ.JP, aes(x=IQ, y=JobPerformance, colour = MNAR.is.missing)) + geom_point(aes(shape = MNAR.is.missing), size = 5) + theme_bw() %+replace% theme(legend.position = "bottom")
print(p3)