# Generate 100 data points from the uniform distribution.
x <- runif(100) * 100

# Develop a sampling experiment that takes n samples of size sample.size and
# plot it on a histogram.
do.experiment <- function(n, sample.size=30) {
  
  means <- numeric(n)
  
  for (i in 1:n) {
    means[i] <- mean(sample(x, size=sample.size))
  }
  
  hist(means, freq=FALSE,
       col="steelblue3", border="steelblue4",
       main=paste("Distribution of Sample Means (", n, " samples)", sep=""),
       xlab="Means")
  
  # Add a mean line.
  abline(v=mean(means), lty=3, col="tomato2")
  
}

# Run the experiment with different numbers of samples.
par(mfrow=c(2, 2))
do.experiment(10)
do.experiment(30)
do.experiment(1000)
do.experiment(10000)

