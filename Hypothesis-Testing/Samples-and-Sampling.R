####
# Samples
####

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

# Take three samples of n=15, n=30, n=100.
sample.4 <- sample(ages, 15)
sample.5 <- sample(ages, 30)
sample.6 <- sample(ages, 100)

# Plot the population and the three samples.
par(mfrow=c(2, 2))
hist(ages, main="Population (n=500)")
hist(sample.4, main="Sample 4 (n=15)")
hist(sample.5, main="Sample 5 (n=30)")
hist(sample.6, main="Sample 6 (n=100)")

# Compare the population and samples means and standard deviations.
print(c(mean(ages), mean(sample.4), mean(sample.5), mean(sample.6)))
print(c(sd(ages), sd(sample.4), sd(sample.5), sd(sample.6)))

####
# Sampling
####

# Record the data.
temps <- c(59.39,62.31,76.77,62.72,68.92,55.52,68.25,58.04,62.95,58.35,58.47,
           63.88,60.61,60.87,58.31,63.38,70.54,62.23,62.4,56.5,76.01,67.47,73.52,
           65.7,66.93,68.18,56.74,66.98,64.87,67.74,56.96,59.07,73.13,62.01,60.08)

# Produce graphical summaries.
par(mfrow=c(1, 2))
hist(temps, main="Distribution of Temperatures", xlab="Temperature")
abline(v=mean(temps), col="tomato3")
boxplot(temps, horizontal=TRUE, main="Distribution of Temperatures", xlab="Temperature")

# View numerical summaries.
summary(temps)
sd(temps)

# Take 10,000 samples of size n=1 from the temperature data.
outcomes <- numeric(10000)
for (i in 1:10000) outcomes[i] <- sample(temps, 1)

# Compare the mean of this sampling with the mean of the original data.
cat(mean(temps), mean(outcomes))
cat(sd(temps), sd(outcomes))

# Take 10,000 samples of size n=30 from the temperature data.
outcomes <- numeric(10000)
for (i in 1:10000) outcomes[i] <- mean(sample(temps, 30))

# Compare the mean of this sampling with the mean of the original data.
cat(mean(temps), mean(outcomes))
cat(sd(temps), sd(outcomes))

# Compare the variability of the original data and sampling data.
par(mfrow=c(1, 2))
hist(temps, main="Histogram of Temperatures", xlab="Temperature")
hist(outcomes, main="Histogram of Temperatures", xlab="Temperature")
