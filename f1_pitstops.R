filename <- readline(prompt = "Enter the CSV File: ")
data <- read.csv(filename)
total_pitstops <- nrow(data)
shortest <- min(data$time)
longest <- max(data$time)
total_time <-sum(data$time)

cat("Total Number of pitstops:", total_pitstops, "\n")
cat("Shortest duration at pitstop:", shortest, "\n")
cat("Longest durstion at pitstops:", longest, "\n")
cat("Total time at pitstops:", total_time, "\n")


