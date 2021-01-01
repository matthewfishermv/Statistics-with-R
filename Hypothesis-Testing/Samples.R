# Generate a set of random data points.
ages <- rnorm(500, 36, 8.7)

# Take three samples of n=10 ages.
sample.1 <- sample(ages, 10)
sample.2 <- sample(ages, 10)
sample.3 <- sample(ages, 10)

# Plot the population and the three samples.
par(mfrow=c(2, 2))
hist(ages, main="Population (n=500)")
hist(sample.1, main="Sample 1 (n=10)")
hist(sample.2, main="Sample 2 (n=10)")
hist(sample.3, main="Sample 3 (n=10)")

# Compare the population and sample means and standard deviations.
print(c(mean(ages), mean(sample.1), mean(sample.2), mean(sample.3)))
print(c(sd(ages), sd(sample.1), sd(sample.2), sd(sample.3)))
