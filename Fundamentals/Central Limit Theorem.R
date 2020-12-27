# Generate 100 data points from the normal distribution with a mean of 10.6
# and a standard deviation of 2.9.
x <- rnorm(100, 10.6, 2.9)

# Summarize the data (numerically).
mean(x)
sd(x)

range(x)
summary(x)

# Summarize the data (graphically).
hist(x)
hist(x, breaks=0:22)

boxplot(x)

# Develop a sampling experiment that will take n samples of size sample.size and
# plot it on a histogram.
do.experiment <- function(n, sample.size=30) {
  
  means <- numeric(n)
  
  for (i in 1:n) {
    means[i] <- mean(sample(x, size=sample.size))
  }
  
  hist(means, xlim=c(9, 12), ylim=c(0, 1), freq=FALSE,
       col="steelblue3", border="steelblue4")
  
  # Add a normal distribution curve.
  x <- seq(5, 16, by=0.1)
  y <- dnorm(x, mean=mean(means), sd=sd(means))
  lines(x, y, col="tomato2")
  
  # Add a mean line.
  abline(v=mean(means), lty=3, col="tomato2")
  
}

# Run the experiment with different numbers of samples.
par(mfrow=c(2, 2))
do.experiment(10)
do.experiment(30)
do.experiment(1000)
do.experiment(10000)

