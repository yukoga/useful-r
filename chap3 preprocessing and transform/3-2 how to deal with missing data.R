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
